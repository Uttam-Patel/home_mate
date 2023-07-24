import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController!.forward();
    _animationController!.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  WelcomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Center(
            child: FadeTransition(
              opacity: _animationController!,
              child: child,
            ),
          ),
        );
      },
      child: const YourSplashScreenContent(), // Replace with your own splash screen content
    );
  }
}

class YourSplashScreenContent extends StatelessWidget {
  const YourSplashScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 120,
              width: 120,
              child: Image.asset('assets/images/logo.png')),
          SizedBox(height: 10,),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 65,fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(text: 'H', style: TextStyle(color: clPrimary,fontSize: 80)),
                TextSpan(text: 'ome '),
                TextSpan(text: 'M', style: TextStyle(color: clPrimary,fontSize: 80)),
                TextSpan(text: 'ate '),
              ],
            ),
            textScaleFactor: 0.5,
          )

        ],
      ),
    );
  }
}