import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce/features/product/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/features/product/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 250), // سرعة خاطفة
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut, // منحنى خفيف جداً
              ),
              child: child,
            );
          },
        );
      case Routes.register:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const RegisterScreen(),
          transitionDuration: const Duration(milliseconds: 250), // سرعة خاطفة
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut, // منحنى خفيف جداً
              ),
              child: child,
            );
          },
        );
      case Routes.home:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 250), // سرعة خاطفة
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut, // منحنى خفيف جداً
              ),
              child: child,
            );
          },
        );
      case Routes.products:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ProductScreen(),
          transitionDuration: const Duration(milliseconds: 250), // سرعة خاطفة
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut, // منحنى خفيف جداً
              ),
              child: child,
            );
          },
        );
      case Routes.productsDetails:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ProductDetailsScreen(),
          transitionDuration: const Duration(milliseconds: 250), // سرعة خاطفة
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut, // منحنى خفيف جداً
              ),
              child: child,
            );
          },
        );
        case Routes.cart:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CartScreen(),
          transitionDuration: const Duration(milliseconds: 250), // سرعة خاطفة
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut, // منحنى خفيف جداً
              ),
              child: child,
            );
          },
        );
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: Center(child: const Text('No Route Found')),
      ),
    );
  }
}
