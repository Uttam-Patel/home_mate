import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_mate/constant/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<DropDownValueModel> country = [
    const DropDownValueModel(
      name: 'India',
      value: 'India',
    ),
    const DropDownValueModel(
      name: "Nepal",
      value: "Nepal",
    ),
    const DropDownValueModel(
      name: 'Bangladesh',
      value: 'Bangladesh',
    ),
    const DropDownValueModel(
      name: 'Shri Lanka',
      value: 'Shri Lanka',
    )
  ];
  @override
  void initState() {
    super.initState();
    //DropDownValueModel country;
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width * 1;
    double screenheight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clPrimary,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: SizedBox(
                  width: screenwidth * 0.3,
                  height: screenheight * 0.15,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Image.png'),
                  ),
                ),
              ),
              Positioned(
                top: screenheight * 0.1,
                left: screenwidth * 0.55,
                child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/Camera.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Column(
              children: [
                simpletextformfield(
                    "Full Name", "Full Name", Icons.account_circle_outlined),
                simpletextformfield(
                    "Email", "saul@user.com", Icons.mail_outline_outlined),
                simpletextformfield("Contact Number", "+91 9409529203",
                    Icons.phone_android_outlined),
                dropdowntextfield("Select Country", "India"),
                simpletextformfield("Address", "Sector-26,gandhinagar",
                    Icons.location_on_outlined),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: clPrimary),
                onPressed: () {},
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  simpletextformfield(
    String labeltext,
    String hinttext,
    IconData icon,
  ) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: hinttext,
            suffixIcon: Icon(
              icon,
            ),
            contentPadding: const EdgeInsets.only(
              left: 17,
              top: 20,
              bottom: 20,
            ),
            label: Text(
              labeltext,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  dropdowntextfield(String labeltext, String hintext) {
    return Column(
      children: [
        DropDownTextField(
          dropDownList: country,
          textFieldDecoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            label: const Text(
              "Select country",
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
