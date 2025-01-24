import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_haven/core/utils/app_colors.dart';
import 'package:home_haven/core/utils/app_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
  });

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 280.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          suffixIcon: Icon(
                            Icons.camera_alt_outlined,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          labelText: "Search candles",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppIcons.notification,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      AppIcons.location,
                    ),
                    SizedBox(width: 5.w),
                    Text("Deliver to"),
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        "3517 W. Gray St. Utica, Pennsylvania",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity.w,
            height: 200.h,
            child: PageView(
              controller: _pageController,
              children: [
                Image.asset(
                  "assets/images/banner.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/page.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/banner1.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SmoothPageIndicator(
              axisDirection: Axis.horizontal,
              effect: JumpingDotEffect(
                activeDotColor: AppColors.mainColor,
              ),
              controller: _pageController,
              count: 3, // Number of pages
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special Offers",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("See More"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200.h,
                  width: double.infinity.w,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppColors.whiteColor,
                        child: SizedBox(
                          width: 150.w,
                          height: 150.h,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 15.h),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  "assets/images/chair.png",
                                ),
                              ),
                              SizedBox(
                                width: 120.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "EKERO",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightGreyColor,
                                      ),
                                    ),
                                    Text(
                                      "\$230.00",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "\$512.58",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          "4.9",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        Text(
                                          " (256)",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
