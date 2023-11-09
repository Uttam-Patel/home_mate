import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/category_model.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/screens/search.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final bool isFeatured;
  const CategoryCard({
    super.key,
    required this.category,
    required this.isFeatured,
  });

  factory CategoryCard.featured({required category}){
     return CategoryCard(category: category,isFeatured: true,);
  }

  factory CategoryCard.all({required category}){
    return CategoryCard(category: category, isFeatured: false);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchService(
              category: category.name,
            ),
          ),
        );
      },
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: isFeatured ? 0.27.sw : 0.40.sw,
            height: isFeatured ? 65.h : 90.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(category.coverUrl),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: isFeatured ? 0.27.sw : 0.40.sw,
            height: isFeatured ? 55.h :55.h,
            decoration: BoxDecoration(
              color: clContainer,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        ],
      ),
    );
  }
}