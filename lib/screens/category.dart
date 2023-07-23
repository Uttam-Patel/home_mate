import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/category_model.dart';
import 'package:home_mate/screens/drawer.dart';
import 'package:home_mate/widgets/category_card.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width * 1;
    double screenheight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: clBG,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: const Text(
          "Category",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: clPrimary,
      ),
      drawer: DrawerPage(),
      body: GridView.builder(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryCard(
          category: categories[index],
          height: screenheight * 0.2,
          width: screenwidth * 0.4,
          font: 15,
        ),
      ),
    );
  }
}
