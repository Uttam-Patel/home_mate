import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_mate/blocs/register_bloc/regester_events.dart';
import 'package:home_mate/blocs/register_bloc/register_states.dart';
import 'package:home_mate/config.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/controllers/register_controller.dart';

import '../blocs/register_bloc/register_bloc.dart';

class SignUp extends StatefulWidget {
  static const routeName = "/sign-up";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? selectedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 12.w),
        child: Center(
          child: SingleChildScrollView(
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 200.h,
                      width: 200.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/signUp.png"))),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "We need some information about you before getting started !",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        selectImage(context);
                      },
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundColor: clBorder,
                        backgroundImage: (selectedFile != null)
                            ? FileImage(selectedFile!)
                            : null,
                        child: (selectedFile == null)
                            ? Icon(
                                Icons.person,
                                size: 40.sp,
                              )
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                            onChanged: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(FNameEvent(value));
                            },
                            maxLength: 10,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 237, 237, 239),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.r))),
                              hintText: "First Name",
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                            onChanged: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(LNameEvent(value));
                            },
                            maxLength: 10,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 237, 237, 239),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.r))),
                              hintText: "Last Name",
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                            onChanged: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(value));
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 237, 237, 239),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.r))),
                              hintText: "Email",
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextField(
                          enabled: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 237, 237, 239),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.r))),
                            hintText:
                                FirebaseAuth.instance.currentUser!.phoneNumber,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "You are here to",
                          style: TextStyle(fontSize: 19.sp),
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: state.flagUser,
                              onChanged: (value) {
                                context
                                    .read<RegisterBloc>()
                                    .add(FlagUserEvent(value));
                              },
                              shape: const CircleBorder(),
                            ),
                            const Text("Get Services"),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: state.flagProvider,
                              onChanged: (value) {
                                if (value != null) {
                                  context
                                      .read<RegisterBloc>()
                                      .add(FlagProviderEvent(value));
                                }
                              },
                              shape: const CircleBorder(),
                            ),
                            const Text("Give Services"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // await submitUserData(context);
                        RegisterController controller =
                            RegisterController(context: context);
                        await controller.submitUserData(context,selectedFile);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(330.w, 48.h),
                          backgroundColor: clPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r))),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void selectImage(context) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      await galleryImage().then((galleryImage) {
                        if (galleryImage != null) {
                          cropImage(img: galleryImage).then((croppedImage) {
                            if (croppedImage != null) {
                              selectedFile = croppedImage;
                              setState(() {

                              });
                            }
                          });
                        }
                      });
                    },
                    leading: const Icon(Icons.photo_album),
                    title: const Text("Select from Gallery"),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      await cameraImage().then((cameraImage) {
                        if (cameraImage != null) {
                          cropImage(img: cameraImage).then((croppedImage) {
                            if (croppedImage != null) {
                              selectedFile = croppedImage;
                              setState(() {

                              });
                            }
                          });
                        }
                      });
                    },
                    leading: const Icon(Icons.camera),
                    title: const Text("Select from Camera"),
                  ),
                ],
              ),
            ));
  }
}
