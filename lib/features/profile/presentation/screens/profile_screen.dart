import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_haven/core/utils/app_colors.dart';
import 'package:home_haven/core/utils/app_icons.dart';
import 'package:home_haven/features/profile/presentation/widgets/section_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity.w,
                  height: 150.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/profile_back.jpg",
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Account",
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Manrope",
                                color: AppColors.whiteColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                height: 25.h,
                                width: 25.w,
                                AppIcons.notification,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Text(
                        "General",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                          fontFamily: "Manrope",
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SectionWidget(
                        leadingIcon: AppIcons.transaction,
                        title: "Transactions",
                        onTap: () {},
                      ),
                      SizedBox(height: 15.h),
                      SectionWidget(
                        leadingIcon: AppIcons.favorite,
                        title: "Wishlist",
                        onTap: () {},
                      ),
                      SizedBox(height: 15.h),
                      SectionWidget(
                        leadingIcon: AppIcons.saved,
                        title: "Saved Address",
                        onTap: () {},
                      ),
                      SizedBox(height: 15.h),
                      SectionWidget(
                        leadingIcon: AppIcons.payment,
                        title: "Payment Methods",
                        onTap: () {},
                      ),
                      SizedBox(height: 15.h),
                      SectionWidget(
                        leadingIcon: AppIcons.notification,
                        title: "Notifications",
                        onTap: () {},
                      ),
                      SizedBox(height: 15.h),
                      SectionWidget(
                        leadingIcon: AppIcons.lock,
                        title: "Security",
                        onTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              right: 20,
              top: 110,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                width: 320.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: AppColors.lightGreyColor.withOpacity(0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Transform.translate(
                  offset: Offset(0, -7),
                  child: ListTile(
                    // contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    leading: CircleAvatar(
                      radius: 25.r,
                      backgroundImage: AssetImage(
                        "assets/images/profile_picture.png",
                      ),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Claire Cooper",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.blackColor,
                            fontFamily: "Inter",
                          ),
                        ),
                        Text(
                          "clairecooper@gmail.com",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackColor,
                            fontFamily: "Inter",
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppIcons.edit,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
