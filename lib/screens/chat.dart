import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      body: const Center(
        child: Text("Chat"),
      ),
    );
  }
}
