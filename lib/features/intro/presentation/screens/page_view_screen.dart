import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:home_haven/core/routes/app_router_names.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/onboarding_widget1.dart';
import '../widgets/onboarding_widget2.dart';
import '../widgets/onboarding_widget3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

int _currentIndex = 0;

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                if (_currentIndex == 2) {
                  context.go(AppRouterNames.register);
                }
                setState(() {
                  _currentIndex = value;
                  log(value.toString());
                });
              },
              controller: pageViewController,
              children: [
                OnboardingWidget1(),
                OnboardingWidget2(),
                OnboardingWidget3(),
              ],
            ),
          ),
          if (_currentIndex != 3)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: SmoothPageIndicator(
                axisDirection: Axis.horizontal,
                effect: JumpingDotEffect(
                  activeDotColor: AppColors.mainColor,
                ),
                controller: pageViewController,
                count: 3, // Number of pages
              ),
            ),
          ElevatedButton(
            onPressed: () {
              if (_currentIndex == 2) {
                context.go(AppRouterNames.register);
              }
              log(_currentIndex.toString());
              pageViewController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 150,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
