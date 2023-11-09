import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_mate/blocs/auth_bloc/auth_bloc.dart';
import 'package:home_mate/blocs/register_bloc/register_bloc.dart';
import 'package:home_mate/blocs/welcome_bloc/welcome_bloc.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/firebase_options.dart';
import 'package:home_mate/routes.dart';
import 'package:home_mate/screens/splashscreen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Home mate',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: clPrimary),
            useMaterial3: true,
            textTheme: GoogleFonts.workSansTextTheme(),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: clPrimary,
                foregroundColor: Colors.white,
              ),
            ),
            appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: clPrimary,
              titleTextStyle: TextStyle(color: Colors.white,fontSize: 22.sp),
            ),
            scaffoldBackgroundColor: clBG,
            primaryColor: clPrimary,
          ),
          onGenerateRoute: (RouteSettings settings)=>CustomRoutes.generateRoute(settings),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
