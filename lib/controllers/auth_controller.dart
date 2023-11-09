import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mate/blocs/auth_bloc/auth_events.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../config.dart';
import '../screens/sign_up.dart';
import '../widgets/bottom_nav.dart';

class AuthController {
  final BuildContext context;
  const AuthController({required this.context});

  void verifyUserPhoneNumber() {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      final state = context.read<AuthBloc>().state;
      String number = state.number;
      if (number.isEmpty) {
        snackMessage(msg: "Please Enter Your Phone Number");
        return;
      }
      processDialog(context);
      auth.verifyPhoneNumber(
        phoneNumber: "+91$number",
        codeSent: (String verificationId, int? resendToken) {
          context.read<AuthBloc>().add(ReceivedIDEvent(verificationId));
          context.read<AuthBloc>().add(FlagEvent(true));
          Navigator.pop(context);
        },
        timeout: const Duration(minutes: 1),
        codeAutoRetrievalTimeout: (String verificationId) {},
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException error) {
          Navigator.pop(context);
          snackMessage(msg: error.message!);
        },
      );
    } catch (e) {
      snackMessage(msg: e.toString());
    }
  }

  Future<void> verifyOTPCode() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      final state = context.read<AuthBloc>().state;
      String receivedID = state.receivedID;
      String otp = state.otp;
      if (otp.isEmpty || receivedID.isEmpty || otp.length < 6) {
        snackMessage(msg: "Please Enter Valid OTP");
        return;
      }
      processDialog(context);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedID,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential).then((value) async {
        User? user = value.user;
        if (user != null) {
          if (user.displayName != null && user.displayName! != "" ) {
            await getUserDetails(user, context).then((value) {
              if(type.isNotEmpty){
                context.read<AuthBloc>().add(FlagEvent(false));
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    NavBar.routeName,
                    arguments: const NavBar(index: 0),
                        (route) => false);
              }else {
                context.read<AuthBloc>().add(FlagEvent(false));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                        (route) => false);
              }

            });
          } else {
            context.read<AuthBloc>().add(FlagEvent(false));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignUp()),
                (route) => false);
          }
        }
      });
    } on FirebaseException catch (e) {
      context.read<AuthBloc>().add(FlagEvent(false));
      if (e.code == "invalid-verification-code") {
        Navigator.pop(context);
        print(e.code);
        snackMessage(msg: "Incorrect OTP");
      } else {
        Navigator.pop(context);
        print(e.code);
        snackMessage(msg: e.code);
      }
      // Navigator.pop(context);
    }
  }
}
