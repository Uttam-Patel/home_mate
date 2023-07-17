import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      body: const Center(
        child: Text("Profile"),
      ),
    );
  }
}
