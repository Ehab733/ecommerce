import 'package:ecommerce/core/helpers/get_started/get_started_screen.dart';
import 'package:ecommerce/core/helpers/onborading/onborading_screen.dart';
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
import 'package:ecommerce/core/helpers/splash/splash_screen.dart';
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
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: Routes.forgetPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.verifyCodeResetPassword,
        builder: (context, state) {
          final email = state.extra as String;
          return VerificationScreen(email: email);
        },
      ),
      GoRoute(
        path: Routes.addNewPassword,
        builder: (context, state) {
          final email = state.extra as String;
          return CreateNewPasswordScreen(email: email);
        },
      ),
      GoRoute(
        path: Routes.getStartd,
        builder: (context, state) => const GetStartedScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.products,
        builder: (context, state) {
          final category = state.extra as Category;
          return ProductScreen(category: category);
        },
      ),
      GoRoute(
        path: Routes.productsDetails,
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetailsScreen(product: product);
        },
      ),
      GoRoute(
        path: Routes.cart,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: Routes.wishlist,
        builder: (context, state) => const WishlistTab(),
      ),
    ],
  );
}
