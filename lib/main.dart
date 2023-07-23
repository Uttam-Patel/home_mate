import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_mate/firebase_options.dart';
import 'package:home_mate/screens/splashscreen.dart';
import 'package:home_mate/screens/welcome.dart';
import 'package:home_mate/widgets/bottom_nav.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home mate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.workSansTextTheme(),
      ),
      home:  SplashScreen(),
    );
  }
}
