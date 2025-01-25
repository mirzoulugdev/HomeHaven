import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../widgets/home_widget.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;

  final List<Widget> pages = [
    HomeWidget(),
    CartScreen(),
    ProfileScreen(),
  ];

  late AnimationController _controller;
  late List<Snowflake> _snowflakes;
  ui.Image? _snowflakeImage;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _snowflakes = List.generate(30, (index) => Snowflake());

    _loadImage('assets/images/snowflake.png').then((image) {
      setState(() {
        _snowflakeImage = image;
      });
    });

    _controller.addListener(() {
      for (var snowflake in _snowflakes) {
        snowflake.update();
      }
      setState(() {});
    });
  }

  Future<ui.Image> _loadImage(String asset) async {
    final data = await rootBundle.load(asset);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          if (_snowflakeImage != null)
            CustomPaint(
              size: MediaQuery.of(context).size,
              painter: SnowPainter(_snowflakes, _snowflakeImage!),
            ),
          SafeArea(
            child: pages[currentPage],
          ),
        ],
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

class Snowflake {
  double x =
      Random().nextDouble() * 400; // Tasodifiy boshlang‘ich X koordinatasi
  double y =
      Random().nextDouble() * 800; // Tasodifiy boshlang‘ich Y koordinatasi
  double speed = Random().nextDouble() * 2 + 1; // Harakat tezligi
  double size = Random().nextDouble() * 40 + 20; // Tasvir hajmi

  void update() {
    y += speed;
    if (y > 800) {
      y = -10;
      x = Random().nextDouble() * 400; // Qor parchasi qayta tiklanadi
    }
  }
}

class SnowPainter extends CustomPainter {
  final List<Snowflake> snowflakes;
  final ui.Image snowflakeImage;

  SnowPainter(this.snowflakes, this.snowflakeImage);

  @override
  void paint(Canvas canvas, Size size) {
    for (var snowflake in snowflakes) {
      paintSnowflake(canvas, snowflake);
    }
  }

  void paintSnowflake(Canvas canvas, Snowflake snowflake) {
    final paint = Paint();
    canvas.drawImageRect(
      snowflakeImage,
      Rect.fromLTWH(0, 0, snowflakeImage.width.toDouble(),
          snowflakeImage.height.toDouble()),
      Rect.fromCenter(
        center: Offset(snowflake.x, snowflake.y),
        width: snowflake.size,
        height: snowflake.size,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
