import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_mate/config.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/category_model.dart';
import 'package:home_mate/widgets/category_card.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category",
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("categories").snapshots(),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasData){
            List<CategoryModel> userCategories = snapshot.data!.docs.map((e) => CategoryModel.fromMap(e.data())).toList();
            if(userCategories.isNotEmpty){


              return Padding(
                padding: EdgeInsets.only(top:20.h,bottom: 60.h),
                child: SingleChildScrollView(
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 0.05.sw,
                      runSpacing: 15.h,
                      children:
                      [
                        for(CategoryModel i in userCategories)
                          CategoryCard.all(category: i)
                      ],
                    ),
                  ),
                ),
              );

              // return GridView.builder(
              //     semanticChildCount: userCategories.length,
              //     itemCount: userCategories.length,
              //     padding: EdgeInsets.only(top: 15.h, bottom: 60.h,left: 25.w,right: 25.w),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         childAspectRatio: 0.72.h,
              //         crossAxisSpacing: 20.w,
              //         mainAxisSpacing: 10.h
              //     ),
              //     itemBuilder: (context, index) {
              //       return CategoryCard.all(category: userCategories[index]);
              //     });
            }
            return const Center(child: Text("No Categories Found"),);

          }
          return const Center(child: Text("Something went wrong"),);
        }
      ),
    );
  }
}
