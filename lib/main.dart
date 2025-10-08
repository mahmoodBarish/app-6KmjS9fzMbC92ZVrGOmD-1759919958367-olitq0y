import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/number_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/select_location_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/beverages_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/my_cart_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/account_screen.dart';
import 'screens/error_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/search_screen.dart';
import 'screens/order_accepted_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash_screen',
  routes: [
    GoRoute(
      path: '/splash_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/onboarding_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: '/sign_in_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: '/number_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const NumberScreen();
      },
    ),
    GoRoute(
      path: '/verification_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const VerificationScreen();
      },
    ),
    GoRoute(
      path: '/select_location_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const SelectLocationScreen();
      },
    ),
    GoRoute(
      path: '/login_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/sign_up_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: '/product_detail_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const ProductDetailScreen();
      },
    ),
    GoRoute(
      path: '/explore_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const ExploreScreen();
      },
    ),
    GoRoute(
      path: '/beverages_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const BeveragesScreen();
      },
    ),
    GoRoute(
      path: '/filters_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const FiltersScreen();
      },
    ),
    GoRoute(
      path: '/my_cart_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const MyCartScreen();
      },
    ),
    GoRoute(
      path: '/favorites_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const FavoritesScreen();
      },
    ),
    GoRoute(
      path: '/account_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const AccountScreen();
      },
    ),
    GoRoute(
      path: '/error_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const ErrorScreen();
      },
    ),
    GoRoute(
      path: '/checkout_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const CheckoutScreen();
      },
    ),
    GoRoute(
      path: '/search_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const SearchScreen();
      },
    ),
    GoRoute(
      path: '/order_accepted_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const OrderAcceptedScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}
