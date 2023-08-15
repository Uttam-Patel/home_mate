import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_mate/config.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/provider_model.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/screens/user/book_service.dart';

class ServiceDetail extends StatefulWidget {
  final ServiceModel info;
  const ServiceDetail({super.key, required this.info});

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  late ServiceModel info;
  late ProviderUserModel provider;
  @override
  void initState() {
    info = widget.info;
    provider = ProviderUserModel.fromMap(info.provider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width * 1;
    double screenheight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: clBorder,
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: screenwidth,
                height: screenheight * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(info.coverUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: (screenheight * 0.45 - ((screenheight * 0.3) / 2)),
                left: ((screenwidth - screenwidth * 0.9) / 2),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.white,
                  ),
                  width: screenwidth * 0.9,
                  height: screenheight * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            info.category,
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: clPrimary,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            info.subCategory,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        info.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "₹${info.price}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: clPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Duration:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "01 Hour",
                            style: TextStyle(
                              fontSize: 14,
                              color: clPrimary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Rating:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                info.rating.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: clPrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 15,
                top: 15,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: clBG,
                  child: SvgPicture.asset(
                    'assets/icons/Heart.svg',
                    fit: BoxFit.cover,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                      radius: 17,
                      backgroundColor: clBG,
                      child: const Icon(Icons.arrow_back)),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: (screenheight * 0.3 / 2) + 10),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  color: clBorder,
                  // height: phoneheight - imageheight,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        info.description,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      NetworkImage(provider.profileUrl),
                                  radius: screenheight * 0.04,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${provider.fName} ${provider.lName}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    printRating(provider.rating)
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(provider.email,),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  provider.location,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  provider.phone,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                          bottom: 25,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "View all",
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 80,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    height: 99,
                                    width: 99,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/servicecover1.png',
                                        ),
                                      ),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 99,
                                    width: 99,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/servicecover1.png',
                                        ),
                                      ),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 99,
                                    width: 99,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/servicecover1.png',
                                        ),
                                      ),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 99,
                                    width: 99,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/servicecover1.png',
                                        ),
                                      ),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("View all")
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'assets/images/Image.png',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Gor Darshil",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          InkWell(onTap: () {}, child: const Text("Edit")),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4.5",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet",
                        style: TextStyle(overflow: TextOverflow.clip),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'assets/images/Image.png',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Gor Darshil",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          InkWell(onTap: () {}, child: const Text("Edit")),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4.5",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet",
                        style: TextStyle(overflow: TextOverflow.clip),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 20,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Related Services",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("View all"),
              ],
            ),
            //all hear.
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const BookService()),
                ),
              );
            },
            backgroundColor: clPrimary,
            child: const Text(
              "Continue",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
