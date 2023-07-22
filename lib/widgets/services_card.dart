import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel info;
  const ServiceCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 10),
      height: 311,
      width: 280,
      decoration:
          BoxDecoration(color: clBG, borderRadius: BorderRadius.circular(25)),
      child: Stack(
        children: [
          Container(
            height: 145,
            width: 280,
            decoration: BoxDecoration(
              color: clBG,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              image: DecorationImage(
                image: AssetImage(info.coverImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 14,
            top: 16,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: clBG,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                info.category.toUpperCase(),
                style: TextStyle(
                  color: clPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Positioned(
            top: 128,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: clPrimary,
                border: Border.all(color: clBG, width: 3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "\$${info.price.toString()}",
                style: TextStyle(
                    color: clBG, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Positioned(
            top: 145,
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              height: 166,
              width: 280,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          if (info.rating - index >= 1) {
                            return const Icon(
                              Icons.star,
                              color: Colors.yellow,
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
                                  colors: [clBody, Colors.yellow],
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(info.rating.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    info.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(info.provider.profileUrl),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${info.provider.fName} ${info.provider.lName}",
                        style: TextStyle(fontSize: 16, color: clBody),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
