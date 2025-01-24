import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_haven/core/utils/app_colors.dart';
import 'core/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        title: "HomeHaven",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.mainColor,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
