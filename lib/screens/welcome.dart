import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/screens/login.dart';

import '../blocs/welcome_bloc/welcome_bloc.dart';
import '../blocs/welcome_bloc/welcome_events.dart';
import '../blocs/welcome_bloc/welcome_states.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = "/welcome";
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 34.h),
        width: 375.w,
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView.builder(
                  itemCount: 4,
                  controller: _controller,
                  onPageChanged: (index) {
                    state.index = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  itemBuilder: (context, index) => _page(index, context),
                ),
                Positioned(
                  top: 510.h,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (state.index < 3) {
                            _controller.animateToPage(state.index + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOutCubicEmphasized);
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const LogIn()));
                          }
                        },

                        child: Container(
                          margin: EdgeInsets.only(top: 50.h, left: 30.w, right: 30.w),
                          width: 300.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: clPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(50.w)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(5.w, 5.h),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              state.index!=3?"Next":"Get Started",
                              style: TextStyle(fontSize: 14.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      DotsIndicator(
                        position: state.index,
                        dotsCount: 4,
                        decorator: DotsDecorator(
                          color: Colors.black.withOpacity(0.5),
                          size: const Size(8, 8),
                          activeSize: const Size(18, 8),
                          activeColor: clPrimary,
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Stack _page(int index, BuildContext context) {
    return Stack(
      // clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 58.w,
          bottom: 210.h,
          child: CircleAvatar(
            backgroundColor: const Color(0xFFF0F0FA),
            radius: 341.r,
          ),
        ),
        Positioned(
          top: 90.h,
          left: 20.w,
          right: 20.w,
          child: Image.asset(
            welcomePages[index].imgUrl,
            width: 335.w,
            height: 325.h,
          ),
        ),
        Positioned(
          top: 430.h,
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  welcomePages[index].heading,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  welcomePages[index].subHeading,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WelcomePage {
  final String imgUrl;
  final String heading;
  final String subHeading;

  WelcomePage(
      {required this.imgUrl, required this.heading, required this.subHeading});
}

List<WelcomePage> welcomePages = [
  WelcomePage(
    imgUrl: "assets/images/welcome_screen1.png",
    heading: "Welcome To HomeMate",
    subHeading:
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
  ),
  WelcomePage(
    imgUrl: "assets/images/welcome_screen2.png",
    heading: "Book The Appointment",
    subHeading: "Book your services on your own time ",
  ),
  WelcomePage(
    imgUrl: "assets/images/welcome_screen3.png",
    heading: "Payment Gateway",
    subHeading: "Choose the preferable options of payment and get best service",
  ),
  WelcomePage(
    imgUrl: "assets/images/welcome_screen4.png",
    heading: "Find Your Service",
    subHeading: "Find your service as per your preferences",
  ),
];
