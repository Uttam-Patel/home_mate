import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,

      appBar: AppBar(
        backgroundColor: clPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("About Us",
          style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
