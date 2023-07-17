import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      body: const Center(
        child: Text("LOG IN"),
      ),
    );
  }
}
