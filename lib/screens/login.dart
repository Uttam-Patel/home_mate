import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_mate/constant/colors.dart';

import 'sign_up.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Hello BK!",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome Back,You Have Been Missed For Long Time ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 70,
                ),
                const TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 237, 237, 239),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: "Email Address",
                        suffixIcon: Icon(Icons.email))),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 237, 237, 239),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye))),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Remember Me",
                    ),
                    const SizedBox(
                      width: 75,
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: clPrimary),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
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
                // const SizedBox(height: 2),
                Row(
                  children: [
                    const SizedBox(width: 40),
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90,
                      child: Divider(),
                    ),
                    Text(" Or Continue With "),
                    SizedBox(
                      width: 90,
                      child: Divider(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: CircleAvatar(
                          radius: 24,
                          backgroundColor:
                              const Color.fromARGB(255, 237, 237, 239),
                          child: SvgPicture.asset('assets/icons/Google.svg')),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      child: CircleAvatar(
                          radius: 24,
                          backgroundColor:
                              const Color.fromARGB(255, 237, 237, 239),
                          child: SvgPicture.asset('assets/icons/Calling.svg')),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
