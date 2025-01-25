import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_haven/features/cart/data/repositories/cart_repository.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.grey.shade200,
          scrolledUnderElevation: 0,
          pinned: true,
          title: Text(
            "My Cart",
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w800,
              fontFamily: "Manrope",
              color: AppColors.blackColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.notification,
              ),
            ),
          ],
        ),
        SliverList.builder(
          itemCount: CartRepository.cartItems.length,
          itemBuilder: (context, index) {
            final cart = CartRepository.cartItems[index];
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              width: 340.w,
              height: 170.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: AppColors.lightGreyColor.withOpacity(0.3),
                    blurRadius: 10.r,
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  spacing: 20,
                  children: [
                    SizedBox(
                      width: 120.w,
                      height: 120.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.asset(
                          cart.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cart.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          '\$${cart.price}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Manrope",
                            fontWeight: FontWeight.w800,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            Text(
                              '\$${cart.oldPrice}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                decoration: TextDecoration.lineThrough,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
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
                                "${cart.discount}% OFF",
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
                        Text(
                          cart.color,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGreyColor.withOpacity(0.5),
                          ),
                        ),
                        Row(
                          spacing: 15,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_outline_rounded,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 105.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    width: 1.w,
                                    color: Colors.grey.shade300,
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.remove,
                                    color: AppColors.mainColor,
                                  ),
                                  Text(cart.quantity.toString()),
                                  Icon(
                                    Icons.add,
                                    color: AppColors.mainColor,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
