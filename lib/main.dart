import 'package:ecommerce/core/app_bloc_observer.dart';
import 'package:ecommerce/core/di/get_it.dart';
import 'package:ecommerce/core/network/network_cubit.dart';
import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_cubit.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _initDefered();
  FlutterNativeSplash.remove();
  runApp(const EcommerceApp());
}

Future<void> _initDefered() async {
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  await ScreenUtil.ensureScreenSize();
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
        BlocProvider(create: (_) => getIt.get<NetworkCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp.router(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
