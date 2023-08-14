import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,

      appBar: AppBar(
        backgroundColor: clPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Help & Support",
          style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
