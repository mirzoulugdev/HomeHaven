import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_haven/core/utils/app_colors.dart';
import 'package:home_haven/core/utils/app_icons.dart';
import 'package:home_haven/features/home/presentation/widgets/home_widget.dart';
import 'package:home_haven/features/home/presentation/widgets/my_account_widget.dart';
import 'package:home_haven/features/home/presentation/widgets/my_cart_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  final List<Widget> pages = [
    HomeWidget(),
    MyAccountWidget(),
    MyCartWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: pages[currentPage],
      ),
      bottomNavigationBar: Container(
        width: double.infinity.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.whiteColor,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          selectedLabelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
            color: AppColors.mainColor,
          ),
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.home,
                height: currentPage == 0 ? 25.0.h : 20,
                color: currentPage == 0
                    ? AppColors.mainColor
                    : AppColors.iconColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.shoppingCart,
                height: currentPage == 1 ? 25.0.h : 20,
                color: currentPage == 1
                    ? AppColors.mainColor
                    : AppColors.iconColor,
              ),
              label: "My Cart",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.person,
                height: currentPage == 2 ? 25.0.h : 20,
                color: currentPage == 2
                    ? AppColors.mainColor
                    : AppColors.iconColor,
              ),
              label: "My Account",
            ),
          ],
        ),
      ),
    );
  }
}
