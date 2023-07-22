import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_mate/constant/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                    radius: 40,
                    child: SvgPicture.asset('assets/icons/UserImage.svg')),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Hello BK!",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text('Create Your Account For\nBetter Experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 237, 237, 239),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "Full Name",
                      suffixIcon: SvgPicture.asset(
                        'assets/icons/Profile.svg',
                        height: 10,
                        width: 10,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color.fromARGB(255, 237, 237, 239),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "User Name",
                      suffixIcon: Icon(Icons.person_2_sharp)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 237, 237, 239),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "Email",
                      suffix: SvgPicture.asset(
                        'assets/icons/Profile.svg',
                        height: 19,
                        width: 25,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color.fromARGB(255, 237, 237, 239),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "Contact Number",
                      suffixIcon: Icon(Icons.phone)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color.fromARGB(255, 237, 237, 239),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "Password",
                      suffixIcon: Icon(Icons.remove_red_eye)),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(330, 48),
                      backgroundColor: clPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
