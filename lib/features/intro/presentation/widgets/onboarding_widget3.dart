import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class OnboardingWidget3 extends StatelessWidget {
  const OnboardingWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: Image.asset(
            fit: BoxFit.cover,
            AppImages.viewImage1,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 340.w,
          child: Text(
            "Get Support From Our Skilled Team",
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
            "If our products don't meet your expectations, we're available 24/7 to assist you.",
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
