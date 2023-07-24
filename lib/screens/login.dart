import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/widgets/bottom_nav.dart';

import 'sign_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    super.initState();
  }

  late bool flag = false;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 220,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logIn.png"))),
                ),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "You Have Been Missed For Long Time ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: controller1,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      enabled: !flag,
                      fillColor: Color.fromARGB(255, 237, 237, 239),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: "Phone Number",
                    )),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: flag,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                          controller: controller2,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 237, 237, 239),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            hintText: "Enter OTP",
                          )),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavBar(index: 0)),
                        (route) => false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NavBar(index: 0))); // Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(330, 48),
                      backgroundColor: clPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    flag ? "Submit" : "Send OTP",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
