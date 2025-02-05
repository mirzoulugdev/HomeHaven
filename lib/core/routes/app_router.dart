import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../cache/cache_helper.dart';
import '../di/service_locator.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import 'app_router_names.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/intro/presentation/screens/page_view_screen.dart';
import '../../features/intro/presentation/screens/splash_screen.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: getIt<CacheHelper>().getToken() != null
        ? AppRouterNames.home
        : AppRouterNames.splash,
    navigatorKey: _navigatorKey,
    routes: [
      GoRoute(
        path: AppRouterNames.splash,
        name: AppRouterNames.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRouterNames.home,
        name: AppRouterNames.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRouterNames.register,
        name: AppRouterNames.register,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: AppRouterNames.login,
        name: AppRouterNames.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRouterNames.pageView,
        name: AppRouterNames.pageView,
        builder: (context, state) => PageViewScreen(),
      ),
      GoRoute(
        path: AppRouterNames.cart,
        name: AppRouterNames.cart,
        builder: (context, state) => CartScreen(),
      ),
      GoRoute(
        path: AppRouterNames.profile,
        name: AppRouterNames.profile,
        builder: (context, state) => ProfileScreen(),
      ),
    ],
  );
}
