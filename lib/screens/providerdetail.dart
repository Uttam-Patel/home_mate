import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/provider_model.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/widgets/services_card.dart';

class ProviderDetails extends StatefulWidget {
  final ProviderUserModel provider;
  const ProviderDetails({super.key, required this.provider});

  @override
  State<ProviderDetails> createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  late ProviderUserModel info;
  @override
  void initState() {
    super.initState();
    info = widget.provider;
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width * 1;
    double screenheight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clPrimary,
        title: const Text(
          "Provider Detail",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: const Color(0xFFF6F7F9),
            height: screenheight * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      info.profileUrl,
                    ),
                    radius: screenwidth * 0.13,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${info.fName} ${info.lName}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(info.tagline),
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) {
                              if (info.rating - index >= 1) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 20,
                                );
                              } else if (info.rating - index >= 0 &&
                                  info.rating - index < 1) {
                                return ShaderMask(
                                  blendMode: BlendMode.modulate,
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [clBody, Colors.orange],
                                    ).createShader(bounds);
                                  },
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                );
                              } else {
                                return Icon(
                                  Icons.star,
                                  color: clBody,
                                  size: 20,
                                );
                              }
                            },
                          ),
                          Text(info.rating.toString()),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Text(
                    info.description,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenwidth * 0.1),
            padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: const Color(0xFFF6F7F9),
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          info.email,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Number",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          info.phone,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Member Since",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          info.joined.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          homeServices(screenwidth, screenheight)
        ],
      ),
    );
  }

  Column homeServices(double screenwidth, double screenheight) {
    return Column(
      children: [
        for (int i = 0; i <= 5; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: screenheight * 0.42,
            width: screenwidth * 0.9,
            child: ServiceCard(
              info: demoServices[i],
              width: screenwidth,
            ),
          ),
      ],
    );
  }
}
