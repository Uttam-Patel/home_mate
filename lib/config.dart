import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_mate/blocs/register_bloc/regester_events.dart';
import 'package:home_mate/blocs/register_bloc/register_bloc.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/category_model.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/model/user_model.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

//User Details
String type = "";
late UserModel normalUser;
late ProviderModel providerUser;
late AdminModel adminUser;
late List<CategoryModel> providerCategories;
late List<ServiceModel> bookmarks;
String paymentMethod = "";

//Get User Details

Future<void> getUserDetails(User? user, BuildContext context) async {
  await FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .get()
      .then((snap) async {
    if (snap.exists) {
      Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
      type = data['type'];
      await getBookmarks(user).then((value) async {
        if (type == "admin") {
          adminUser = AdminModel.fromMap(data);
        } else if (type == "provider") {
          providerUser = ProviderModel.fromMap(data);
          paymentMethod = providerUser.paymentMethod ?? "cash";
          await getCategories();
        } else {
          normalUser = UserModel.fromMap(data);
          paymentMethod = normalUser.paymentMethod ?? "cash";
        }
      });
    }
  });
}

//Categories for providers

Future<void> getCategories() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("categories").get();
  providerCategories = snapshot.docs
      .map((e) => CategoryModel.fromMap(e.data() as Map<String, dynamic>))
      .toList();
}

// Liked Services by user

Future<void> getBookmarks(User? user) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .collection("bookmarks")
      .get();
  bookmarks = snapshot.docs
      .map((e) => ServiceModel.fromMap(e.data() as Map<String, dynamic>))
      .toList();
}

Future<void> updateBookmarks(ServiceModel service, User? user) async {
  if (bookmarks.where((element) => element.id == service.id).isEmpty) {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("bookmarks")
        .doc(service.id)
        .set(service.toMap());
    bookmarks.add(service);
  } else {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("bookmarks")
        .doc(service.id)
        .delete();
    bookmarks.removeWhere((element) => element.id == service.id);
  }
}

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
          } else if (rating - index > 0 && rating - index < 1) {
            return const Icon(
              Icons.star_half,
              color: Colors.orange,
              size: 20,
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

snackMessage(
    {required String msg,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: backgroundColor,
    textColor: textColor,
    gravity: ToastGravity.SNACKBAR,
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 16.sp,
  );
}

Future<File?> cameraImage() async {
  File? file;
  await ImagePicker()
      .pickImage(source: ImageSource.camera)
      .then((selectedFile) {
    if (selectedFile != null) {
      file = File(selectedFile.path);
    }
  });
  return file;
}

Future<File?> galleryImage() async {
  File? file;
  await ImagePicker()
      .pickImage(source: ImageSource.gallery)
      .then((selectedFile) {
    if (selectedFile != null) {
      file = File(selectedFile.path);
    }
  });
  return file;
}

Future<File?> cropImage({
  required File img,
  CropAspectRatio? aspectRatio = const CropAspectRatio(ratioY: 1, ratioX: 1),
  CropStyle cropStyle = CropStyle.circle,
  int compressQuality = 90,
}) async {
  File? file;
  CroppedFile? croppedImage = await ImageCropper().cropImage(
    sourcePath: img.path,
    aspectRatio: aspectRatio,
    cropStyle: cropStyle,
    compressQuality: compressQuality,
  );
  if (croppedImage != null) {
    file = File(croppedImage.path);
  }
  return file;
}

Future<String> uploadImage({File? file, required String path}) async {
  try {
    if (file != null) {
      UploadTask task =
          FirebaseStorage.instance.ref().child(path).putFile(file);

      TaskSnapshot snap = await task;

      Future<String> downloadUrl = snap.ref.getDownloadURL();

      return downloadUrl;
    } else {
      return "";
    }
  } on FirebaseException catch (e) {
    snackMessage(msg: e.code);
    return "";
  }
}

TextField customTextField(
    {String? hintText,
    bool? filled = true,
    Color? fillColor = const Color.fromARGB(255, 237, 237, 239),
    TextInputType? keyboardType,
    int? maxLength,
    void Function(String)? onChanged}) {
  return TextField(
      onChanged: onChanged,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        counterText: "",
        filled: filled,
        fillColor: fillColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        hintText: hintText,
      ));
}

//Service Rating


