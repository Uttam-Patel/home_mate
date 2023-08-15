import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final double height;
  final double width;
  final double font;
  // final double height = 140;
  // final double width = 120;
  // final double font = 19;

  // final double height = 200;
  // final double width = 190;
  // final double font = 22;
  const CategoryCard({
    super.key,
    required this.category,
    required this.height,
    required this.width,
    required this.font,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: width,
            height: height * 0.7,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: clContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Image.network(
              category.coverUrl,
              // height: height / 3,
              // width: height / 3,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: height * 0.3,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              category.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: font,
              ),
            ),
          )
        ],
      ),
    );
  }
}
