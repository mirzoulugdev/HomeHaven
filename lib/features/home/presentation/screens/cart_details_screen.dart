import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../data/models/product_model.dart';
import '../widgets/cart_description_widget.dart';
import '../widgets/select_color_widget.dart';

class CartDetailsScreen extends StatelessWidget {
  final Data productDetails;
  const CartDetailsScreen({required this.productDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade200,
            expandedHeight: 300,
            floating: true,
            scrolledUnderElevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.5,
              background: Image.network(
                height: 300.h,
                width: 300.w,
                "https://e-commerce.birnima.uz/${productDetails.image[0]}",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity.w,
              height: 900.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartDescriptionWidget(
                      shortDescription: productDetails.shortDescription,
                      productPrice: productDetails.price,
                      productRate: productDetails.rating.toString(),
                      productRateCount: productDetails.ratingCount.toString(),
                      productTitle: productDetails.name,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SelectColorWidget(),
                    SizedBox(height: 20.h),
                    Divider(
                      height: 1.h,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Product Description",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                      width: 340.w,
                      child: Text(
                        productDetails.description,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.lightGreyColor,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Divider(
                      height: 1.h,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Size",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Width:"),
                        Text("${productDetails.size.width.toString()} cm"),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      height: 1.h,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Depth:"),
                        Text("${productDetails.size.depth.toString()} cm"),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      height: 1.h,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Height:"),
                        Text("${productDetails.size.heigth.toString()} cm"),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      height: 1.h,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Seat Width:"),
                        Text("${productDetails.size.seatWidth.toString()} cm"),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      height: 1.h,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Seat Depth:"),
                        Text("${productDetails.size.seatDepth.toString()} cm"),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      height: 1.h,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Seat Width:"),
                        Text("${productDetails.size.seatHeigth.toString()} cm"),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      height: 1.h,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        width: double.infinity.w,
        height: 85.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: AppColors.lightGreyColor.withOpacity(0.4),
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  width: 1.w,
                  color: AppColors.mainColor,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.favorite,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 285.w,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.mainColor,
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope",
                  color: AppColors.whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
