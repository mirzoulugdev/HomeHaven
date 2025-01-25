import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../blocs/Products/product_bloc.dart';
import '../screens/cart_details_screen.dart';
import 'banner_view.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
  });

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final PageController _pageController = PageController();

  // @override
  // void initState() {
  //   context.read<ProductBloc>().add(FetchProductEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(listener: (context, state) {
      if (state is ProductError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage)),
        );
      }
    }, builder: (context, state) {
      if (state is ProductLoading) {
        return Center(
          child: CupertinoActivityIndicator(
            // context.read<ProductBloc>().add(FetchProductBanner());

            radius: 15.r,
            color: AppColors.mainColor,
          ),
        );
      } else if (state is Fetched) {
        final product = state.products;

        if (product == null || product.data.isEmpty) {
          return Center(
            child: Text("No products found."),
          );
        }

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
                          onPressed: () async {
                            await getIt<CacheHelper>().resetToken();
                          },
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
              BannerView(),
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
                      height: 250.h,
                      width: double.infinity.w,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: product.data.length,
                        itemBuilder: (context, index) {
                          final pro = product.data[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) =>
                                      CartDetailsScreen(productDetails: pro)));
                            },
                            child: Card(
                              color: AppColors.whiteColor,
                              child: SizedBox(
                                width: 160.w,
                                height: 250.h,
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 15.h),
                                    SizedBox(
                                      height: 100.h,
                                      width: 120.w,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        child: Image.network(
                                          fit: BoxFit.cover,
                                          "https://e-commerce.birnima.uz/${product?.data[index].image[0]}",
                                          //
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product!.data[index].name,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.lightGreyColor,
                                            ),
                                          ),
                                          Text(
                                            "\$${product!.data[index].price}",
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
                                                color: AppColors.amberColor,
                                              ),
                                              Text(
                                                product!.data[index].rating
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Inter",
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                              Text(
                                                " (${product?.data[index].ratingCount})",
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
      return Container();
    });
  }
}
