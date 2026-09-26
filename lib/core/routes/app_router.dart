import 'package:ecommerce/core/helpers/get_started/get_started_screen.dart';
import 'package:ecommerce/core/helpers/onborading/onborading_screen.dart';
import 'package:ecommerce/core/helpers/promo/promo_screen.dart';
import 'package:ecommerce/core/helpers/special_offers/special_offers_screen.dart';
import 'package:ecommerce/core/helpers/splash/splash_screen.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce/features/forget_password/presentation/screens/add_new_password_screen.dart';
import 'package:ecommerce/features/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:ecommerce/features/forget_password/presentation/screens/verify_code_reset_password_screen.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/features/product/presentation/screens/product_screen.dart';
import 'package:ecommerce/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.login,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.register,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: Routes.forgetPassword,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const ForgotPasswordScreen(),
        ),
      ),
      GoRoute(
        path: Routes.verifyCodeResetPassword,
        pageBuilder: (context, state) {
          final email = state.extra as String;
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: VerificationScreen(email: email),
          );
        },
      ),
      GoRoute(
        path: Routes.addNewPassword,
        pageBuilder: (context, state) {
          final email = state.extra as String;
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: CreateNewPasswordScreen(email: email),
          );
        },
      ),
      GoRoute(
        path: Routes.getStartd,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const GetStartedScreen(),
        ),
      ),
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: Routes.products,
        pageBuilder: (context, state) {
          final category = state.extra as Category;
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: ProductScreen(category: category),
          );
        },
      ),
      GoRoute(
        path: Routes.productsDetails,
        pageBuilder: (context, state) {
          final product = state.extra as Product;
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: ProductDetailsScreen(product: product),
          );
        },
      ),
      GoRoute(
        path: Routes.cart,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const CartScreen(),
        ),
      ),
      GoRoute(
        path: Routes.wishlist,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const WishlistTab(),
        ),
      ),
      GoRoute(
        path: Routes.specialOffer,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const InStoreOffersScreen(),
        ),
      ),
      // أضف روت جديد للـ Promo
      // داخل ملف app_router.dart:
      GoRoute(
        path: Routes.promoDetails, // تأكد من إضافة المسار في ملف Routes
        pageBuilder: (context, state) {
          final args = state.extra as PromoDetailsArguments;
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: PromoDetailsScreen(arguments: args),
          );
        },
      ),
    ],
  );
}

CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(
      milliseconds: 300,
    ), // مدة الانتقال بسلاسة
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // تأثير Fade نعم مع حركة صعود بسيطة جداً لإعطاء طابع فاخر
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        child: SlideTransition(
          position:
              Tween<Offset>(
                begin: const Offset(0, 0.03), // تحرك بسيط من أسفل لأعلى
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
          child: child,
        ),
      );
    },
  );
}
