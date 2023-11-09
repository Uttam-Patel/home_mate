import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_mate/blocs/register_bloc/regester_events.dart';
import 'package:home_mate/blocs/register_bloc/register_bloc.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/controllers/register_controller.dart';

class ProviderSignUp extends StatelessWidget {
  static const routeName = "/provider-sign-up";
  const ProviderSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/signUp.png"))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: const Text(
                    "We need some information about you before getting started !",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onChanged: (value){
                        context.read<RegisterBloc>().add(ProviderTaglineEvent(value));
                      },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.r))),
                          hintText: "eg. Electrician",
                          labelText: "Job Title",
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 200.h,
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(),
                      ),
                      child: TextField(
                        onChanged: (value){
                          context.read<RegisterBloc>().add(ProviderDescriptionEvent(value));
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          hintText: "Job Description",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await RegisterController(context: context)
                        .submitProviderData(context);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(330.w, 48.h),
                      backgroundColor: clPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r))),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
