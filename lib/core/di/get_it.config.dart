// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/core/di/register_module.dart' as _i709;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i395;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i258;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i407;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i385;
import 'package:ecommerce/features/auth/data/repositories/auth_repository_impl.dart'
    as _i689;
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart'
    as _i33;
import 'package:ecommerce/features/auth/domain/useCases/login_usecase.dart'
    as _i186;
import 'package:ecommerce/features/auth/domain/useCases/logout_usecase.dart'
    as _i52;
import 'package:ecommerce/features/auth/domain/useCases/register_usecase.dart'
    as _i471;
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart'
    as _i1057;
import 'package:ecommerce/features/cart/data/data_source/remote_data_source/cart_api_remote_data_source.dart'
    as _i1040;
import 'package:ecommerce/features/cart/data/data_source/remote_data_source/cart_remote_data_source.dart'
    as _i35;
import 'package:ecommerce/features/cart/data/respositories/cart_repository_impl.dart'
    as _i370;
import 'package:ecommerce/features/cart/domain/respositories/cart_repository.dart'
    as _i626;
import 'package:ecommerce/features/cart/domain/usecases/add_to_cart_usecase.dart'
    as _i853;
import 'package:ecommerce/features/cart/domain/usecases/delete_from_cart_usecase.dart'
    as _i518;
import 'package:ecommerce/features/cart/domain/usecases/get_cart_usecase.dart'
    as _i213;
import 'package:ecommerce/features/cart/domain/usecases/update_cart_usecase.dart'
    as _i806;
import 'package:ecommerce/features/cart/presentation/manager/cart_cubit.dart'
    as _i800;
import 'package:ecommerce/features/home/data/data_sources/remote_data_source/home_api_remote_data_source.dart'
    as _i455;
import 'package:ecommerce/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i488;
import 'package:ecommerce/features/home/data/repositories/home_repository_impl.dart'
    as _i1028;
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart'
    as _i572;
import 'package:ecommerce/features/home/domain/usecases/category_usecase.dart'
    as _i713;
import 'package:ecommerce/features/home/presentation/manager/home_cubit.dart'
    as _i926;
import 'package:ecommerce/features/product/data/data_source/remote_data_source/product_remote_api_data_source.dart'
    as _i991;
import 'package:ecommerce/features/product/data/data_source/remote_data_source/product_remote_data_source.dart'
    as _i88;
import 'package:ecommerce/features/product/data/repositories/product_repository_impl.dart'
    as _i276;
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart'
    as _i601;
import 'package:ecommerce/features/product/domain/usecases/product_usecase.dart'
    as _i171;
import 'package:ecommerce/features/product/presentation/manager/product_cubit.dart'
    as _i538;
import 'package:ecommerce/features/wishlist/data/data_source/wishlist_api_remote_data_source.dart'
    as _i985;
import 'package:ecommerce/features/wishlist/data/data_source/wishlist_remote_data_source.dart'
    as _i497;
import 'package:ecommerce/features/wishlist/data/repositories/wishlist_repository_impl.dart'
    as _i133;
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart'
    as _i1016;
import 'package:ecommerce/features/wishlist/domain/usecases/add_product_to_wish_list_use_case.dart'
    as _i612;
import 'package:ecommerce/features/wishlist/domain/usecases/delete_product_from_wishlist_usecase.dart'
    as _i24;
import 'package:ecommerce/features/wishlist/domain/usecases/get_user_wishlist_usecase.dart'
    as _i251;
import 'package:ecommerce/features/wishlist/presentation/manager/cubit/wish_list_cubit.dart'
    as _i759;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i497.WishlistRemoteDataSource>(
      () => _i985.WishlistApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i488.HomeRemoteDataSource>(
      () => _i455.HomeApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.singleton<_i385.AuthRemoteDataSource>(
      () => _i407.AuthApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i88.ProductRemoteDataSource>(
      () => _i991.ProductRemoteApiDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i572.HomeRepository>(
      () => _i1028.HomeRepositoryImpl(gh<_i488.HomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i35.CartRemoteDataSource>(
      () => _i1040.CartApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i626.CartRepository>(
      () => _i370.CartRepositoryImpl(gh<_i35.CartRemoteDataSource>()),
    );
    gh.singleton<_i395.AuthLocalDataSource>(
      () => _i258.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i713.CategoryUsecase>(
      () => _i713.CategoryUsecase(gh<_i572.HomeRepository>()),
    );
    gh.lazySingleton<_i1016.WishlistRepository>(
      () => _i133.WishlistRepositoryImpl(gh<_i497.WishlistRemoteDataSource>()),
    );
    gh.lazySingleton<_i612.AddProductToWishListUseCase>(
      () => _i612.AddProductToWishListUseCase(gh<_i1016.WishlistRepository>()),
    );
    gh.lazySingleton<_i24.DeleteProductFromWishlistUsecase>(
      () => _i24.DeleteProductFromWishlistUsecase(
        gh<_i1016.WishlistRepository>(),
      ),
    );
    gh.lazySingleton<_i251.GetUserWishlistUsecase>(
      () => _i251.GetUserWishlistUsecase(gh<_i1016.WishlistRepository>()),
    );
    gh.singleton<_i759.WishListCubit>(
      () => _i759.WishListCubit(
        gh<_i251.GetUserWishlistUsecase>(),
        gh<_i612.AddProductToWishListUseCase>(),
        gh<_i24.DeleteProductFromWishlistUsecase>(),
      ),
    );
    gh.lazySingleton<_i601.ProductRepository>(
      () => _i276.ProductRepositoryImpl(gh<_i88.ProductRemoteDataSource>()),
    );
    gh.lazySingleton<_i853.AddToCartUsecase>(
      () => _i853.AddToCartUsecase(gh<_i626.CartRepository>()),
    );
    gh.lazySingleton<_i518.DeleteFromCartUsecase>(
      () => _i518.DeleteFromCartUsecase(gh<_i626.CartRepository>()),
    );
    gh.lazySingleton<_i213.GetCartUsecase>(
      () => _i213.GetCartUsecase(gh<_i626.CartRepository>()),
    );
    gh.lazySingleton<_i806.UpdateCartUsecase>(
      () => _i806.UpdateCartUsecase(gh<_i626.CartRepository>()),
    );
    gh.singleton<_i33.AuthRepository>(
      () => _i689.AuthRepositoryImpl(
        gh<_i385.AuthRemoteDataSource>(),
        gh<_i395.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i800.CartCubit>(
      () => _i800.CartCubit(
        gh<_i853.AddToCartUsecase>(),
        gh<_i213.GetCartUsecase>(),
        gh<_i806.UpdateCartUsecase>(),
        gh<_i518.DeleteFromCartUsecase>(),
      ),
    );
    gh.lazySingleton<_i926.HomeCubit>(
      () => _i926.HomeCubit(gh<_i713.CategoryUsecase>()),
    );
    gh.lazySingleton<_i171.ProductUsecase>(
      () => _i171.ProductUsecase(gh<_i601.ProductRepository>()),
    );
    gh.singleton<_i186.LoginUsecase>(
      () => _i186.LoginUsecase(gh<_i33.AuthRepository>()),
    );
    gh.singleton<_i52.LogoutUsecase>(
      () => _i52.LogoutUsecase(gh<_i33.AuthRepository>()),
    );
    gh.singleton<_i471.RegisterUsecase>(
      () => _i471.RegisterUsecase(gh<_i33.AuthRepository>()),
    );
    gh.factory<_i538.ProductCubit>(
      () => _i538.ProductCubit(gh<_i171.ProductUsecase>()),
    );
    gh.singleton<_i1057.AuthCubit>(
      () => _i1057.AuthCubit(
        loginUsecase: gh<_i186.LoginUsecase>(),
        registerUsecase: gh<_i471.RegisterUsecase>(),
        logoutUsecase: gh<_i52.LogoutUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
