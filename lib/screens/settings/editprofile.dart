import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_mate/config.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/screens/profile.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  User user = FirebaseAuth.instance.currentUser!;
  FirebaseAuth auth = FirebaseAuth.instance;
  Reference storageRef = FirebaseStorage.instance.ref();
  String? profileUrl;
  String receivedID = "";
  bool flag = false;
  late String fullName;
  late String emailID;
  late String phone;
  File? profileImage;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    name.text = user.displayName!;
    fullName = user.displayName!;
    email.text = user.email!;
    emailID = user.email!;
    number.text = user.phoneNumber!;
    phone = user.phoneNumber!;
    profileUrl = user.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width * 1;
    double screenheight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clPrimary,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: SizedBox(
                  width: screenwidth * 0.3,
                  height: screenheight * 0.15,
                  child: CircleAvatar(
                    backgroundColor: clBG,
                    backgroundImage: (profileImage != null)
                        ? FileImage(profileImage!)
                        : (profileUrl != null)
                            ? NetworkImage(profileUrl!)
                                as ImageProvider<Object>?
                            : null,
                    child: (profileUrl == null)
                        ? const Icon(
                            Icons.person,
                            size: 40,
                          )
                        : null,
                  ),
                ),
              ),
              Positioned(
                top: screenheight * 0.1,
                left: screenwidth * 0.55,
                child: InkWell(
                  onTap: () {
                    selectImage(context);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/Camera.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      simpletextformfield(
                        "Full Name",
                        "First Last",
                        name,
                        Icons.account_circle_outlined,
                        (value) {
                          if (value == null) {
                            return "This field can't be null";
                          } else if (value.length < 5) {
                            return "Minimum length is 5";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null) {
                            return "This field can't be null";
                          } else if (value.length < 8) {
                            return "Minimum length is 8";
                          } else if (!value.characters.contains('@')) {
                            return "@ not found";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (x) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          enabled: !flag,
                          hintText: "example@email.com",
                          suffixIcon: (user!.emailVerified &&
                                  (user!.email == email.text.trim()))
                              ? const Icon(Icons.verified)
                              : const Icon(Icons.email),
                          contentPadding: const EdgeInsets.only(
                            left: 17,
                            top: 20,
                            bottom: 20,
                          ),
                          label: const Text(
                            "Email",
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: number,
                        validator: (value) {
                          if (value == null) {
                            return "This value can't be null";
                          } else if ((!value.contains("+91") &&
                                  value.length != 10) ||
                              (value.contains("+91") && value.length != 13)) {
                            return "Enter valid number";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        onChanged: (x) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          enabled: !flag,
                          hintText: "9876543210",
                          suffixIcon: (user!.phoneNumber == number.text.trim())
                              ? const Icon(Icons.verified)
                              : (number.text.trim() != phone &&
                                      "+91${number.text.trim()}" != phone &&
                                      ((!number.text.trim().contains("+91") &&
                                              number.text.length == 10) ||
                                          (number.text.trim().contains("+91") &&
                                              number.text.length == 13)))
                                  ? InkWell(
                                      onTap: () {
                                        verifyUserPhoneNumber(context);
                                      },
                                      child: Text(
                                        "Send OTP ",
                                        style: TextStyle(
                                            color: clPrimary, height: 3),
                                      ),
                                    )
                                  : const Icon(Icons.phone),
                          contentPadding: const EdgeInsets.only(
                            left: 17,
                            top: 20,
                            bottom: 20,
                          ),
                          label: const Text(
                            "Phone Number",
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: flag,
                        child: Form(
                          key: otpKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller2,
                                maxLength: 6,
                                onChanged: (x) {
                                  setState(() {});
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return "This value can't be null";
                                  } else if (value.length != 6) {
                                    return "Enter valid 6 digit OTP";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(6),
                                ],
                                decoration: InputDecoration(
                                  counterText: "",
                                  hintText: "Six Digit OTP",
                                  suffixIcon:
                                      (controller2.text.trim().length == 6)
                                          ? InkWell(
                                              onTap: () {
                                                verifyOTPCode(context);
                                              },
                                              child: Text(
                                                "Verify ",
                                                style: TextStyle(
                                                    color: clPrimary,
                                                    height: 3),
                                              ),
                                            )
                                          : const Icon(Icons.phone),
                                  contentPadding: const EdgeInsets.only(
                                    left: 17,
                                    top: 20,
                                    bottom: 20,
                                  ),
                                  label: const Text(
                                    "OTP",
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      simpletextformfield("Address", "Sector-26,gandhinagar",
                          address, Icons.location_on_outlined, (value) {
                        return null;
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: clPrimary),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    processDialog(context);
                    if (name.text.trim() != fullName) {
                      await user.updateDisplayName(name.text);
                    }
                    if (email.text.trim() != emailID) {
                      await user.updateEmail(email.text.trim());
                    }
                    if (profileImage != null) {
                      await user
                          .updatePhotoURL(await uploadProfile(profileImage));
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()),
                        (route) => false);
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  simpletextformfield(
    String labeltext,
    String hinttext,
    TextEditingController controller,
    IconData icon,
    String? Function(String?) validator,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hinttext,
            suffixIcon: Icon(
              icon,
            ),
            contentPadding: const EdgeInsets.only(
              left: 17,
              top: 20,
              bottom: 20,
            ),
            label: Text(
              labeltext,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  void verifyUserPhoneNumber(context) {
    if (formKey.currentState!.validate()) {
      processDialog(context);
      auth.verifyPhoneNumber(
        phoneNumber: (number.text.contains("+91", 0))
            ? number.text
            : "+91${number.text}",
        codeSent: (String verificationId, int? resendToken) {
          receivedID = verificationId;
          flag = true;
          Navigator.pop(context);
          setState(() {});
        },
        timeout: const Duration(minutes: 1),
        codeAutoRetrievalTimeout: (String verificationId) {
          Navigator.pop(context);
          snackMessage(context, "Time Out");
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          await user.updatePhoneNumber(credential);
          flag = false;
          Navigator.pop(context);
          setState(() {});
        },
        verificationFailed: (FirebaseAuthException error) {
          Navigator.pop(context);
          snackMessage(context, error.message!);
        },
      );
    }
  }

  Future<void> verifyOTPCode(context) async {
    if (otpKey.currentState!.validate()) {
      processDialog(context);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedID,
        smsCode: controller2.text,
      );
      await user.updatePhoneNumber(credential);
      flag = false;
      Navigator.pop(context);
      setState(() {});
    }
  }

  void selectImage(context) async {
    XFile? selectedFile;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      selectedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (selectedFile != null) {
                        cropImage(selectedFile!);
                      }
                    },
                    leading: const Icon(Icons.photo_album),
                    title: const Text("Select from Gallery"),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      selectedFile = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (selectedFile != null) {
                        cropImage(selectedFile!);
                      }
                    },
                    leading: const Icon(Icons.photo_album),
                    title: const Text("Select from Camera"),
                  ),
                ],
              ),
            ));
  }

  void cropImage(XFile img) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: img.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      cropStyle: CropStyle.circle,
      compressQuality: 50,
    );

    if (croppedImage != null) {
      setState(() {
        profileImage = File(croppedImage.path);
      });
    }
  }

  Future<String> uploadProfile(File? file) async {
    UploadTask task =
        storageRef.child("images/profiles/${user.uid}").putFile(file!);

    TaskSnapshot snap = await task;

    Future<String> downloadUrl = snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
