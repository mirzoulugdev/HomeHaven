import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_haven/core/utils/app_colors.dart';
import 'package:home_haven/core/utils/app_icons.dart';

class SectionWidget extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final Function() onTap;
  const SectionWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity.w,
      height: 56.h,
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
      child: ListTile(
        onTap: onTap,
        minVerticalPadding: 5,
        leading: SvgPicture.asset(leadingIcon),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right_rounded,
          size: 30.sp,
        ),
      ),
    );
  }
}
