import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerView extends StatelessWidget {
  BannerView({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
