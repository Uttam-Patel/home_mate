import 'package:flutter/material.dart';
import 'package:home_mate/screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen())));
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}
