import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_mate/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home mate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.workSansTextTheme(),
      ),
      home: const SplashScreen(),
    );
  }
}
