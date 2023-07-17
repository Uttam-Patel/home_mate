import 'package:flutter/material.dart';
import 'package:home_mate/screens/category.dart';
import 'package:home_mate/screens/chat.dart';
import 'package:home_mate/screens/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_mate/screens/profile.dart';
import 'package:home_mate/screens/ticket.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> screens = const [
    Home(),
    TicketBooking(),
    Categories(),
    Chat(),
    Profile(),
  ];
  Widget currentScreen = const Home();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                index = 0;
                currentScreen = screens[index];
                setState(() {});
              },
              child: SvgPicture.asset(
                (index == 0)
                    ? "assets/icons/Home1.svg"
                    : "assets/icons/Home.svg",
                height: 23,
                width: 23,
              ),
            ),
            InkWell(
              onTap: () {
                index = 1;
                currentScreen = screens[index];
                setState(() {});
              },
              child: SvgPicture.asset(
                (index == 1)
                    ? "assets/icons/Ticket1.svg"
                    : "assets/icons/Ticket.svg",
                height: 23,
                width: 23,
              ),
            ),
            InkWell(
              onTap: () {
                index = 2;
                currentScreen = screens[index];
                setState(() {});
              },
              child: SvgPicture.asset(
                (index == 2)
                    ? "assets/icons/Category1.svg"
                    : "assets/icons/Category.svg",
                height: 23,
                width: 23,
              ),
            ),
            InkWell(
              onTap: () {
                index = 3;
                currentScreen = screens[index];
                setState(() {});
              },
              child: SvgPicture.asset(
                (index == 3)
                    ? "assets/icons/Chat1.svg"
                    : "assets/icons/Chat.svg",
                height: 23,
                width: 23,
              ),
            ),
            InkWell(
              onTap: () {
                index = 4;
                currentScreen = screens[index];
                setState(() {});
              },
              child: SvgPicture.asset(
                (index == 4)
                    ? "assets/icons/Profile1.svg"
                    : "assets/icons/Profile.svg",
                height: 23,
                width: 23,
              ),
            ),
          ],
        ),
      ),
      body: currentScreen,
    );
  }
}
