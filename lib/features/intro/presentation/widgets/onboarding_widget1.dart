import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class OnboardingWidget1 extends StatefulWidget {
  const OnboardingWidget1({super.key});

  @override
  State<OnboardingWidget1> createState() => _OnboardingWidget1State();
}

class _OnboardingWidget1State extends State<OnboardingWidget1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: Image.asset(
            fit: BoxFit.cover,
            AppImages.viewImage3,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 340.w,
          child: Text(
            "Online Home Store and Furniture",
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Manrope",
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 340.w,
          child: Text(
            textAlign: TextAlign.center,
            "Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand.",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.lightGreyColor,
              fontFamily: "Inter",
            ),
          ),
        ),
      ],
    );
  }
}
