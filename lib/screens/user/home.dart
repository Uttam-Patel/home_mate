import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_mate/config.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/category_model.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/screens/search.dart';
import 'package:home_mate/screens/servicedetail.dart';
import 'package:home_mate/widgets/bottom_nav.dart';
import 'package:home_mate/widgets/category_card.dart';
import 'package:home_mate/widgets/services_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchText = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      body: SafeArea(
        child: ListView(
          children: [
            topSearchSlider(),
            homeCategories(),
            homeServices(),
            SizedBox(
              height: 60.h,
            ),
          ],
        ),
      ),
    );
  }

  Container homeServices() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      margin: EdgeInsets.only(top: 20.h),
      color: clContainer,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Featured Services",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchService(),
                    ),
                  );
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: clBody,
                  ),
                ),
              ),
            ],
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("services")
                  .where("isFeatured", isEqualTo: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData && snapshot.data != null) {
                  List<ServiceModel> featuredServices = snapshot.data!.docs
                      .map((e) => ServiceModel.fromMap(e.data()))
                      .toList();

                  if (featuredServices.isNotEmpty) {
                    return SizedBox(
                      height: 320.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: featuredServices.length,
                          itemBuilder: (context, index) {
                            return ServiceCard(
                              service: featuredServices[index],
                              width: 250.w,
                            );
                          }),
                    );
                  }
                  return const Center(
                    child: Text("No Featured Services Found"),
                  );
                }
                return const Center(
                  child: Text("Something went wrong"),
                );
              }),
        ],
      ),
    );
  }

  Container homeCategories() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      margin: EdgeInsets.only(top: 60.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Featured Category",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const NavBar(
                          index: 2,
                        ),
                        transitionDuration: const Duration(seconds: 0),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                      (route) => false);
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: clBody,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("categories")
                  .where("isFeatured", isEqualTo: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  List<CategoryModel> featuredCategories = snapshot.data!.docs
                      .map((e) => CategoryModel.fromMap(e.data()))
                      .toList();

                  if (featuredCategories.isNotEmpty) {
                    return Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10.w,
                      runSpacing: 10.w,
                      children: [
                        for (int i = 0; i < featuredCategories.length; i++)
                          SizedBox(
                              height: 120.h,
                              child: CategoryCard.featured(
                                category: featuredCategories[i],
                              )),
                      ],
                    );
                  }
                  return const Center(
                    child: Text("No Featured Categories Found"),
                  );
                }
                return const Center(
                  child: Text("Something went wrong"),
                );
              }),
        ],
      ),
    );
  }

  Stack topSearchSlider() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 0.27.sh,
          width: 1.sw,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("services")
                  .where("isSlider", isEqualTo: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  List<ServiceModel> sliderServices = snapshot.data!.docs
                      .map((e) => ServiceModel.fromMap(e.data()))
                      .toList();
                  if (sliderServices.isNotEmpty) {
                    return PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sliderServices.length,
                      itemBuilder: ((context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ServiceDetail(
                                          info: sliderServices[index])));
                            },
                            child: Image.network(
                              sliderServices[index].coverUrl,
                              fit: BoxFit.cover,
                            ),
                          )),
                    );
                  }
                  return const Center(
                    child: Text("No Slider Services Found"),
                  );
                }
                return const Center(
                  child: Text("Something went wrong"),
                );
              }),
        ),
        Positioned(
          right: 20,
          top: 20,
          child: CircleAvatar(
            backgroundColor: clBG,
            child: const Icon(Icons.notifications_none),
          ),
        ),
        Positioned(
          top: 0.27.sh - 30.h,
          left: (1.sw - (0.9.sw)) / 2,
          child: SizedBox(
            width: 0.9.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center
                  ,
                  width: 0.7.sw,
                  height: 60.h,
                  padding: EdgeInsets.only(left: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  child: TextField(
                    // enabled: false,
                    controller: searchText,
                    decoration: const InputDecoration(
                      hintText: "Search Services",
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchService(
                          query: searchText.text.trim(),
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      color: Colors.white,
                      child: Icon(
                        Icons.search_outlined,
                        size: 30.sp,
                      ),
                    ),
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
