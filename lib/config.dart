import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/category_model.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/model/user_model.dart';

//User Details
String type = "";
List<CategoryModel> userCategories = [];
List<ServiceModel> userServices = [];
late UserModel normalUser;
late AdminModel adminUser;
late ProviderModel providerUser;
List<ServiceModel>? userBookmarkedServices;

//Get User Details

Future<void> getUserDetails(User? user) async {
  DocumentSnapshot snap =
      await FirebaseFirestore.instance.collection("users").doc(user!.uid).get();
  if (snap.exists) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    type = data["type"];
    if (type == "admin") {
      adminUser = AdminModel.fromMap(data);
      await getUserCategories();
    } else if (type == "provider") {
      providerUser = ProviderModel.fromMap(data);
      await getUserCategories();
    } else {
      normalUser = UserModel.fromMap(data);
      await getUserCategories();
    }
  }
}

Future<void> getUserCategories() async {
  QuerySnapshot snap =
      await FirebaseFirestore.instance.collection("categories").get();
  if (snap.size > 0) {
    userCategories = List.generate(
        snap.size,
        (index) => CategoryModel.fromMap(
            snap.docs[index].data() as Map<String, dynamic>));
  }
}

Future<void> getUserServices() async {
  if (type == "user") {
    QuerySnapshot snap =
        await FirebaseFirestore.instance.collection("services").get();
    if (snap.size > 0) {
      userServices = List.generate(
        snap.size,
        (index) => ServiceModel.fromMap(
            snap.docs[index].data() as Map<String, dynamic>),
      );
      List<String> serviceCategoris = userServices.map((e) => e.category).toList();
      userCategories = userCategories.where((element) => serviceCategoris.contains(element.name)).toList();
    }
  }
}

//Find from database

//Most Used Shortcuts
Row printRating(double rating) {
  return Row(
    children: [
      ...List.generate(
        5,
        (index) {
          if (rating == 0) {
            return Icon(
              Icons.star,
              color: clBody,
              size: 20,
            );
          } else if (rating - index >= 1) {
            return const Icon(
              Icons.star,
              color: Colors.orange,
              size: 20,
            );
          } else if (rating - index >= 0 && rating - index < 1) {
            return ShaderMask(
              blendMode: BlendMode.modulate,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [clBody, Colors.orange],
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.star,
                color: Colors.white,
                size: 20,
              ),
            );
          } else {
            return Icon(
              Icons.star,
              color: clBody,
              size: 20,
            );
          }
        },
      ),
      const SizedBox(
        width: 5,
      ),
      Text(rating.toString()),
    ],
  );
}

void processDialog(context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            content: SizedBox(
              height: 200.0,
              width: 200.0,
              child: Center(
                  child: CircularProgressIndicator(
                color: clPrimary,
              )),
            ),
          ));
}

void snackMessage(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
