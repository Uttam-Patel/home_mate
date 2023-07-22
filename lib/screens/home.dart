import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/category_model.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/widgets/bottom_nav.dart';
import 'package:home_mate/widgets/category_card.dart';
import 'package:home_mate/widgets/services_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int imgIndex = 0;
  late PageController imgSliderController;
  List<String> sliderImages = [
    "assets/images/homecover1.png",
    "assets/images/homecover2.png",
    "assets/images/homecover3.png",
    "assets/images/homecover4.png",
  ];

  @override
  void initState() {
    super.initState();
    imgSliderController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    imgSliderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double imgHeight = 250;
    double imgWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: clBG,
      body: ListView(
        children: [
          topSearchSlider(imgHeight, imgWidth),
          homeCategories(imgWidth),
          homeServices(imgWidth),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  Container homeServices(double imgWidth) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: (imgWidth - 380) / 2, vertical: 20),
      margin: const EdgeInsets.only(top: 20),
      color: clContainer,
      width: 380,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Services",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 18,
                    color: clBody,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 311,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoServices.length,
              itemBuilder: (context, index) => ServiceCard(
                info: demoServices[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container homeCategories(double imgWidth) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (imgWidth - 380) / 2),
      margin: const EdgeInsets.only(top: 60),
      width: 380,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Category",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
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
                    fontSize: 18,
                    color: clBody,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 15,
            children: [
              for (int i = 0; i <= 5; i++)
                CategoryCard(
                  category: categories[i],
                  height: 140,
                  width: 120,
                  font: 19,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Stack topSearchSlider(double imgHeight, double imgWidth) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: imgHeight,
          width: imgWidth,
          child: PageView.builder(
            controller: imgSliderController,
            onPageChanged: (value) {
              imgIndex = value;
              setState(() {});

              // Future.delayed(const Duration(seconds: 3), () {
              //   if (imgIndex == sliderImages.length - 1) {
              //     imgIndex = 0;
              //     setState(() {});
              //   } else {
              //     imgSliderController.animateToPage(imgIndex + 1,
              //         duration: const Duration(milliseconds: 350),
              //         curve: Curves.linear);
              //   }
              // });
            },
            scrollDirection: Axis.horizontal,
            itemCount: sliderImages.length,
            itemBuilder: ((context, index) => Image.asset(
                  sliderImages[index],
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          top: imgHeight / 1.3,
          left: (imgWidth - (6 * (sliderImages.length) + 20)) / 2,
          child: Row(
            children: [
              ...List.generate(
                sliderImages.length,
                (value) => InkWell(
                  onTap: () {
                    imgSliderController.animateToPage(value,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.linear);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    width: (value == imgIndex) ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: clBG,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          top: imgHeight - 30,
          left: (imgWidth - 380) / 2,
          child: SizedBox(
            width: 380,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  height: 60,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search Services",
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 60,
                    width: 60,
                    color: Colors.white,
                    child: const Icon(
                      Icons.search_outlined,
                      size: 30,
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
