import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      appBar: AppBar(
        backgroundColor: clPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Privacy Policy",
          style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
