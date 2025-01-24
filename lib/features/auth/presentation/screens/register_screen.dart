import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_haven/core/routes/app_router_names.dart';
import 'package:home_haven/core/utils/app_colors.dart';
import 'package:home_haven/core/utils/app_icons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Manrope",
                  ),
                ),
                Text(
                  "Enter your email to start shopping and get awesome deals today!",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGreyColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                          ),
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        obscureText: _isVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                  ),
                          ),
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 140,
                      vertical: 10,
                    ),
                    backgroundColor: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter",
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120.w,
                      height: 1.h,
                      color: AppColors.lightGreyColor,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                        color: AppColors.lightGreyColor,
                      ),
                    ),
                    Container(
                      width: 120.w,
                      height: 1.h,
                      color: AppColors.lightGreyColor,
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Container(
                  alignment: Alignment.center,
                  width: 350.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      width: 2.w,
                      color: AppColors.mainColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 50.w),
                      SvgPicture.asset(
                        AppIcons.google,
                        width: 30.w,
                      ),
                      Text(
                        "Log In with Google",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainColor,
                        ),
                      ),
                      SizedBox(width: 50.w),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  alignment: Alignment.center,
                  width: 350.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      width: 2.w,
                      color: AppColors.mainColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 50.w),
                      SvgPicture.asset(
                        AppIcons.facebook,
                        width: 30.w,
                      ),
                      Text(
                        "Log In with Facebook",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainColor,
                        ),
                      ),
                      SizedBox(width: 50.w),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 30.w),
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.go(AppRouterNames.login),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: 30.w),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
