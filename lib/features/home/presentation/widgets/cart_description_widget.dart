import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class CartDescriptionWidget extends StatelessWidget {
  final String productTitle;
  final double productPrice;
  final String productRate;
  final String productRateCount;
  final String shortDescription;
  const CartDescriptionWidget({
    super.key,
    required this.productTitle,
    required this.productPrice,
    required this.productRate,
    required this.productRateCount,
    required this.shortDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productTitle,
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: "Inter",
            fontWeight: FontWeight.w300,
            color: AppColors.blackColor,
          ),
        ),
        Row(
          spacing: 10,
          children: [
            Text(
              "\$${(productPrice.ceil() * 45) / 100}",
              style: TextStyle(
                fontSize: 30.sp,
                fontFamily: "Manrope",
                fontWeight: FontWeight.w800,
                color: AppColors.blackColor,
              ),
            ),
            Text(
              "\$$productPrice",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 16.sp,
                fontFamily: "Inter",
                fontWeight: FontWeight.w300,
                color: AppColors.blackColor,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 60.w,
              height: 25.h,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),
              child: Text(
                "45% OFF",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteColor,
                ),
              ),
            )
          ],
        ),
        Row(
          spacing: 5,
          children: [
            Icon(
              Icons.star_rounded,
              color: Colors.amber,
            ),
            Text(
              productRate,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
            Text(
              "($productRateCount)",
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 70.h,
          width: 340.w,
          child: Text(
            shortDescription,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: AppColors.lightGreyColor,
            ),
          ),
        ),
      ],
    );
  }
}
