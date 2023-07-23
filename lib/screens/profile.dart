import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/screens/editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: clPrimary,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              const Center(
                child: SizedBox(
                  width: 100,
                  height: 120,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Image.png'),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.width * 0.178,
                left: MediaQuery.of(context).size.width * 0.513,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      ),
                    );
                  },
                  child: const Image(
                    width: 50,
                    height: 50,
                    image: AssetImage(
                      'assets/images/Edit.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            child: Column(
              children: [
                Text(
                  "Saul Armstrong",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "saularmstrong@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 222, 222, 222),
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
                          fontSize: 18,
                          color: clPrimary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
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
                            fontSize: 20,
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
                                fontSize: 20,
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
                                fontSize: 20,
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
                                fontSize: 20,
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
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color.fromARGB(255, 222, 222, 222),
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
                          fontSize: 18,
                          color: clPrimary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
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
                            fontSize: 20,
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
                                fontSize: 20,
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
                                fontSize: 20,
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
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: clPrimary),
                    onPressed: () {},
                    child: const Text(
                      "LogOut",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  darkmode(String labeltext, SvgPicture picture) {}
}
