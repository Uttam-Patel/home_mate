import 'package:flutter/material.dart';
import 'package:home_mate/config.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/widgets/category_card.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: clBG,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Category",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: clPrimary,
      ),
      body: GridView.builder(
          semanticChildCount: userCategories.length,
          itemCount: userCategories.length,
          padding: EdgeInsets.only(top: 30, bottom: 70,left: screenWidth * 0.1,right: screenWidth * 0.1),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 100/100,
            crossAxisSpacing: screenWidth * 0.1,
              mainAxisSpacing: screenWidth * 0.1
          ),
          itemBuilder: (context, index) {
            return CategoryCard(category: userCategories[index]);
          }),
    );
  }
}
