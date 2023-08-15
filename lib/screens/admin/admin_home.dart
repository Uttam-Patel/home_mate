import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/screens/admin/add_new_category.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clContainer,
      appBar: AppBar(
        backgroundColor: clPrimary,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 220,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 200 / 120,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: clBG,
                    border: Border.all(color: clBody),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "98",
                            style: TextStyle(
                                color: clPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Total Booking",
                            style: TextStyle(color: clBody, fontSize: 10),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 22,
                        child: SvgPicture.asset(
                          "assets/icons/Ticket1.svg",
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: clBG,
                    border: Border.all(color: clBody),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "15",
                            style: TextStyle(
                                color: clPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Total Service",
                            style: TextStyle(color: clBody, fontSize: 10),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 22,
                        child: SvgPicture.asset(
                          "assets/icons/Ticket1.svg",
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: clBG,
                    border: Border.all(color: clBody),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "30",
                            style: TextStyle(
                                color: clPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Total Rating",
                            style: TextStyle(color: clBody, fontSize: 10),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 22,
                        child: SvgPicture.asset(
                          "assets/icons/Ticket1.svg",
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: clBG,
                    border: Border.all(color: clBody),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$45.3",
                            style: TextStyle(
                                color: clPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Total Earning",
                            style: TextStyle(color: clBody, fontSize: 10),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 22,
                        child: SvgPicture.asset(
                          "assets/icons/Ticket1.svg",
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddCategory(),),);
            },
            child: DottedBorder(
              // strokeWidth: 2,
                dashPattern: const [5, 3],
                strokeCap: StrokeCap.square,
                borderPadding: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRect(
                          child: Icon(Icons.add_box,size: 50,color: clPrimary,),
                        ),
                        const Text("Add a New Category"),
                      ],
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
