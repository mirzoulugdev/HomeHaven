import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/service_locator.dart';
import 'core/utils/app_colors.dart';
import 'features/home/presentation/blocs/Products/product_bloc.dart';
import 'core/routes/app_router.dart';
import 'features/auth/presentation/blocs/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>(),
        ),
        BlocProvider<ProductBloc>(
          create: (_) => getIt<ProductBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            title: "HomeHaven",
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.mainColor,
              ),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
