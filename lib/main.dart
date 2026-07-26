import 'package:ecommerce/core/app_bloc_observer.dart';
import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/routes/route_generator.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // 🎯 إبقاء الـ Native Splash شغالة ومنع اختفائها حتى اكتمال التهيئة
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  FlutterNativeSplash.remove();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.get<AuthCubit>()),
        BlocProvider(create: (_) => getIt.get<CartCubit>()),
        BlocProvider(create: (_) => getIt.get<WishListCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splash, // 🎯 شاشة الـ Splash هي البداية المباشرة
        ),
      ),
    );
  }
}
