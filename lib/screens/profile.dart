import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/screens/welcome.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width * 1;
    double screenheight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        backgroundColor: clPrimary,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const Drawer(),
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: SizedBox(
                  width: screenwidth * 0.3,
                  height: screenheight * 0.15,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Image.png'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowField("First Name", "Tom", false),
                ShowField("First Last", "Ford", false),
                ShowField("Phone No", "Tom", false),
                ShowField("City", "Gandhinagar", false),
                ShowField("Country", "India", false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: clPrimary),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  const WelcomeScreen()), (route) => false);
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }

  ShowField(String _lable, String _value,bool _flag) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(" ${_lable}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            )),
        SizedBox(
          height: 3,
        ),
        SizedBox(
          height: 50,
          child: TextFormField(
            enabled: _flag,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.teal,
                  )),

              labelText: _value,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  darkmode(String labeltext, SvgPicture picture) {}
}
