import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_mate/blocs/auth_bloc/auth_bloc.dart';
import 'package:home_mate/blocs/auth_bloc/auth_events.dart';
import 'package:home_mate/blocs/auth_bloc/auth_states.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/controllers/auth_controller.dart';

class LogIn extends StatelessWidget {
  static const routeName = "/log-in";
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        context.read<AuthBloc>().add(OtpEvent(""));
        context.read<AuthBloc>().add(ReceivedIDEvent(""));
        context.read<AuthBloc>().add(FlagEvent(false));
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.w),
          child: Center(
            child: SingleChildScrollView(
              child: BlocBuilder<AuthBloc, AuthState>(

                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 220.h,
                        width: 250.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/logIn.png"))),
                      ),
                      Text(
                        "Welcome",
                        style:
                            TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Your Home, Our Expertise",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                          maxLength: 10,
                          onChanged: (value) {
                            context.read<AuthBloc>().add(NumberEvent(value));
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            constraints: BoxConstraints(maxWidth: 300.w,maxHeight: 60.h),
                            counterText: "",
                            filled: true,
                            enabled: !state.flag,
                            fillColor: const Color.fromARGB(255, 237, 237, 239),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.r))),
                            hintText: "Phone Number",
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Visibility(
                        visible: state.flag,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                                maxLength: 6,
                                onChanged: (value) {
                                  context.read<AuthBloc>().add(OtpEvent(value));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  constraints: BoxConstraints(maxWidth: 300.w,maxHeight: 60.h),
                                  filled: true,
                                  counterText: "",
                                  fillColor: const Color.fromARGB(255, 237, 237, 239),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12.r))),
                                  hintText: "Enter OTP",
                                )),
                            SizedBox(
                              height: 30.h,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          AuthController controller =
                              AuthController(context: context);
                          state.flag
                              ? await controller.verifyOTPCode()
                              : controller.verifyUserPhoneNumber();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(300.w, 48.h),
                            backgroundColor: clPrimary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r))),
                        child: Text(
                          state.flag ? "Submit" : "Send OTP",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
