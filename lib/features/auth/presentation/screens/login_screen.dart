import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_haven/core/routes/app_router_names.dart';
import 'package:home_haven/core/utils/app_colors.dart';
import 'package:home_haven/core/utils/app_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  width: 340.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Manrope",
                        ),
                      ),
                      Text(
                        "Fill in your details below to get started on a seamless shopping experience.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGreyColor,
                        ),
                      ),
                    ],
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
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(AppIcons.person),
                          ),
                          labelText: "First Name",
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
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(AppIcons.person),
                          ),
                          labelText: "Last Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(AppIcons.email),
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: !_isVisible
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                  )
                                : Icon(Icons.visibility_outlined),
                          ),
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(AppIcons.lock),
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
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    context.go(AppRouterNames.home);
                  },
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 10,
                    ),
                    backgroundColor: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter",
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
