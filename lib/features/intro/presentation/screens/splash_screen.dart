import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_router_names.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(Duration(seconds: 5)).then(
            (value) => context.go(AppRouterNames.pageView),
          ),
          builder: (context, snapshot) {
            return Stack(
              children: [
                Container(
                  width: double.infinity.w,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.backgroundColor1,
                        AppColors.mainColor,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity.w,
                  height: double.infinity.h,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.logo,
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "HomeHaven",
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Inter",
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
