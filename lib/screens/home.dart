import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/category_model.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/screens/drawer.dart';
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
    "assets/images/servicecover1.png",
    "assets/images/servicecover2.png",
    "assets/images/servicecover3.png",
    "assets/images/servicecover4.png",
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
    double screenwidth = MediaQuery.of(context).size.width * 1;
    double screenheight = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      backgroundColor: clBG,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: clPrimary,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text("Home Mate",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      drawer: DrawerPage(),
      body: ListView(
        children: [
          // Text(screenwidth.toString()),
          topSearchSlider(screenwidth, screenheight),
          homeCategories(screenwidth, screenheight),
          homeServices(screenwidth, screenheight),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  Container homeServices(double screenwidth, double screenheight) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(top: 20),
      color: clContainer,
      // width: screenwidth * 0.,
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
                  fontSize: 20,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 14,
                    color: clBody,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenheight * 0.42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoServices.length,
              itemBuilder: (context, index) => ServiceCard(
                info: demoServices[index],
                width: screenwidth * 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container homeCategories(double screenwidth, double screenheight) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: const EdgeInsets.only(top: 60),
      // width: screenwidth * 0.9,
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
                  fontSize: 20,
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
                    fontSize: 14,
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
                  height: screenheight * 0.17,
                  width: screenwidth * 0.25,
                  font: 12,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Stack topSearchSlider(double screenwidth, double screenheight) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: screenheight * 0.27,
          width: screenwidth,
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
          top: screenheight * 0.2,
          left: (screenwidth - (6 * (sliderImages.length) + 20)) / 2,
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
          top: screenheight * 0.27 - 30,
          left: (screenwidth - (screenwidth * 0.9)) / 2,
          child: SizedBox(
            width: screenwidth * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenwidth * 0.7,
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
