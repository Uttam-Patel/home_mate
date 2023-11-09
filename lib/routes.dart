import 'package:flutter/material.dart';
import 'package:home_mate/screens/login.dart';
import 'package:home_mate/screens/provider/provider_sign_up.dart';
import 'package:home_mate/screens/sign_up.dart';
import 'package:home_mate/screens/welcome.dart';
import 'package:home_mate/widgets/bottom_nav.dart';

class CustomRoutes {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == WelcomeScreen.routeName) {
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    }
    else if(settings.name == NavBar.routeName){
      final args = settings.arguments as NavBar;
      final index = args.index;
      return MaterialPageRoute(builder: (_)=>NavBar(index: index,));
    }
    else if(settings.name == LogIn.routeName){
      return MaterialPageRoute(builder: (_) => const LogIn());
    }
    else if(settings.name == SignUp.routeName){
      return MaterialPageRoute(builder: (_) => const SignUp());
    }
    else if(settings.name == ProviderSignUp.routeName){
      return MaterialPageRoute(builder: (_) => const ProviderSignUp());
    }
    else {
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Page Not Found"),
                ),
              ));
    }
  }
}

