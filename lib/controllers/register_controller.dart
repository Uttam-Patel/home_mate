import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mate/screens/login.dart';
import '../blocs/register_bloc/register_bloc.dart';
import '../config.dart';
import '../model/user_model.dart';
import '../screens/provider/provider_sign_up.dart';
import '../widgets/bottom_nav.dart';

class RegisterController {
  BuildContext context;

  RegisterController({required this.context});

  User? user = FirebaseAuth.instance.currentUser;


  Future<void> submitUserData(context,selectedFile) async {
    try {
      final state = BlocProvider.of<RegisterBloc>(context).state;
      String fName = state.fName;
      String lName = state.lName;
      String email = state.email;
      bool? flagUser = state.flagUser;
      bool flagProvider = state.flagProvider;

      if (fName.isEmpty) {
        snackMessage(msg: "Please Enter the First Name");
        return;
      }

      if (lName.isEmpty) {
        snackMessage(msg: "Please Enter the Last Name");
        return;
      }

      if (email.isEmpty) {
        snackMessage(msg: "Please Enter the Email");
        return;
      }

      if(!RegExp(
          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email)){
        snackMessage(msg: "Please enter a valid email");
        return;
      }

      if (!flagProvider && !flagUser) {
        snackMessage(msg: "Please Select one option");
        return;
      }
      processDialog(context);

      String profileUrl = await uploadImage(file:selectedFile,path:"images/profiles/${user!.uid}");
      await user!.updateEmail(email.trim());
      await user!.updateDisplayName("${fName.trim()} ${lName.trim()}");
      if (selectedFile != null) {
        await user!.updatePhotoURL(profileUrl);
      }

      if (flagUser) {

        normalUser = UserModel(
          id: user!.uid,
          fName: fName.trim(),
          lName: lName.trim(),
          email: email.trim(),
          location: "Sector 26, Gandhinagar, Gujarat",
          profileUrl: profileUrl,
          phone: user!.phoneNumber!,
          joined: DateTime.now(),
        );

        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .set(normalUser.toMap());
        await getUserDetails(user,context).then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context,
              NavBar.routeName,
              arguments: const NavBar(index: 0),
                  (route) => false);
          });

      } else if (flagProvider) {
        providerUser = ProviderModel(
          id: user!.uid,
          fName: fName.trim(),
          lName: lName.trim(),
          email: email.trim(),
          location: "Sector 26, Gandhinagar, Gujarat",
          profileUrl: profileUrl,
          phone: user!.phoneNumber!,
          joined: DateTime.now(),
          rating: 0.0,
          tagline: "",
          description: "",
        );
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .set(providerUser.toMap()).then((value) {
          Navigator.pop(context);
          Navigator.pushNamed(context, ProviderSignUp.routeName);
        });

      }
    } on FirebaseException catch (e) {
      if(e.code == "requires-recent-login"){
        snackMessage(msg: "Session Expired\nLogin again to continue");
        await FirebaseAuth.instance.signOut().then((value) {
          Navigator.pushNamedAndRemoveUntil(context, LogIn.routeName, (route) => false);

        });
      }else{
        snackMessage(msg: e.message!);
        Navigator.pop(context);
      }

    }
  }


  Future<void> submitProviderData(context) async {

    final state = BlocProvider.of<RegisterBloc>(context).state;
    String tagline = state.providerTagline;
    String description = state.providerDescription;

    if(tagline.isEmpty){
      snackMessage(msg: "Please enter your job title");
      return;
    }

    if(description.isEmpty){
      snackMessage(msg: "Please provide some description for your job");
      return;
    }

    try{
      processDialog(context);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .update({
        "tagline": tagline.trim(),
        "description": description,
      });
      await getUserDetails(user,context).then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const NavBar(index: 0)),
                (route) => false);
      });
    } on FirebaseException catch (e){
      snackMessage(msg: e.message!);
    }
  }
}
