//Service Rating Popup

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_mate/config.dart';
import 'package:home_mate/model/review_model.dart';
import 'package:uuid/uuid.dart';

import '../constant/colors.dart';
import '../model/service_model.dart';

rateService(BuildContext context, String serviceID, User user) {
  String star = "";
  String review = "";
  showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context,setState) {
          return AlertDialog(
              scrollable: false,
              backgroundColor: clContainer,
              title: const Center(child: Text("Rate service")),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () async {
                    await submitRating(star, review, serviceID, user)
                        .then((value) => Navigator.pop(context));
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(color: clPrimary),
                  ),
                ),
              ],
              actionsAlignment: MainAxisAlignment.end,
              content: SizedBox(
                  height: 150.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int index = 0; index < 5; index++)
                            (star.isNotEmpty)
                                ? (index <= int.parse(star))
                                    ? GestureDetector(
                                        onTap: () {
                                          star = index.toString();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 40.sp,
                                        ))
                                    : GestureDetector(
                                        onTap: () {
                                          star = index.toString();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 40.sp,
                                        ))
                                : GestureDetector(
                                    onTap: () {
                                      star = index.toString();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 40.sp,
                                    ))
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 100.h,
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            review = value;
                            setState((){});
                          },
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                            hintText: "Review",
                          ),
                        ),
                      ),
                    ],
                  )));
        }
      ));
}

Future<void> submitRating(
    String star, String reviewText, String serviceID, User user) async {
  try {
    if (star.isEmpty) {
      snackMessage(msg: "Please give some rating");
      return;
    }
    final ReviewModel review = ReviewModel(
        review: reviewText,userId: user.uid, rating: int.parse(star), date: DateTime.now());
    await FirebaseFirestore.instance
        .collection("services")
        .doc(serviceID)
        .collection("reviews")
        .doc(Uuid().v1())
        .set(review.toMap())
        .then((value) async{
          await FirebaseFirestore.instance.collection("services").doc(serviceID).get(
          ).then((value) async{
            ServiceModel temp = ServiceModel.fromMap(value.data()!);
            double rating = temp.rating;
            int ratedBy = temp.ratedBy ?? 0;
            double newRating = ((rating*ratedBy)+double.parse(star))/(ratedBy+1);

            await FirebaseFirestore.instance.collection('services').doc(serviceID).update({
              "rating":newRating,
              "ratedBy":ratedBy+1,
            });
          });
      snackMessage(msg: "Rated Successfully");
    });
  } on FirebaseException catch (e) {
    snackMessage(msg: e.message!);
  }
}
