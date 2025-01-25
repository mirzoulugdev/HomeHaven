import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class OnboardingWidget2 extends StatelessWidget {
  const OnboardingWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: Image.asset(
            fit: BoxFit.cover,
            AppImages.viewImage2,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 340.w,
          child: Text(
            "Delivery Right to Your Doorstep",
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
            "Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep.",
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
