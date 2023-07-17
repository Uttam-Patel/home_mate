import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      body: const Center(
        child: Text("Categories"),
      ),
    );
  }
}
