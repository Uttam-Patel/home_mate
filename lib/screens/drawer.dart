import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_mate/constant/colors.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Center(
            child: SizedBox(
              height: 150,
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/Image.png'),
              ),
            ),
          ),
          const Column(
            children: [
              Text(
                "Tom Ford",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "tomford@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 9,
                        bottom: 9,
                      ),
                      child: Text(
                        "GENERAL",
                        style: TextStyle(
                          fontSize: 16,
                          color: clPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            child: SvgPicture.asset(
                              'assets/icons/mode.svg',
                              height: 23,
                              width: 23,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Dark Mode",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //add switch of light dark mode.
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  'assets/icons/Lock.svg',
                                  height: 23,
                                  width: 23,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Change Password",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 28,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  'assets/icons/Heart.svg',
                                  height: 23,
                                  width: 23,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Favourite Service",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 28,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  'assets/icons/Star.svg',
                                  height: 23,
                                  width: 23,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Rate Us",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 28,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 9,
                        bottom: 9,
                      ),
                      child: Text(
                        "ABOUT APP",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: clPrimary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            child: SvgPicture.asset(
                              'assets/icons/privacy.svg',
                              height: 23,
                              width: 23,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Privacy Policy",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  'assets/icons/term.svg',
                                  height: 23,
                                  width: 23,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  'assets/icons/help.svg',
                                  height: 23,
                                  width: 23,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Help Support",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  'assets/icons/about.svg',
                                  height: 23,
                                  width: 23,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "About Us",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
