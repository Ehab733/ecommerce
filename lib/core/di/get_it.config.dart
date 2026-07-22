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
import 'package:ecommerce/features/cart/domain/usecases/cart_product_usecase.dart'
    as _i223;
import 'package:ecommerce/features/cart/presentation/manager/cart_product_cubit.dart'
    as _i821;
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
    gh.singleton<_i361.Dio>(() => registerModule.dio());
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
    gh.lazySingleton<_i601.ProductRepository>(
      () => _i276.ProductRepositoryImpl(gh<_i88.ProductRemoteDataSource>()),
    );
    gh.lazySingleton<_i223.CartProductUsecase>(
      () => _i223.CartProductUsecase(gh<_i626.CartRepository>()),
    );
    gh.singleton<_i33.AuthRepository>(
      () => _i689.AuthRepositoryImpl(
        gh<_i385.AuthRemoteDataSource>(),
        gh<_i395.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i926.HomeCubit>(
      () => _i926.HomeCubit(gh<_i713.CategoryUsecase>()),
    );
    gh.lazySingleton<_i171.ProductUsecase>(
      () => _i171.ProductUsecase(gh<_i601.ProductRepository>()),
    );
    gh.factory<_i821.CartProductCubit>(
      () => _i821.CartProductCubit(gh<_i223.CartProductUsecase>()),
    );
    gh.singleton<_i186.LoginUsecase>(
      () => _i186.LoginUsecase(gh<_i33.AuthRepository>()),
    );
    gh.singleton<_i471.RegisterUsecase>(
      () => _i471.RegisterUsecase(gh<_i33.AuthRepository>()),
    );
    gh.singleton<_i1057.AuthCubit>(
      () => _i1057.AuthCubit(
        loginUsecase: gh<_i186.LoginUsecase>(),
        registerUsecase: gh<_i471.RegisterUsecase>(),
      ),
    );
    gh.factory<_i538.ProductCubit>(
      () => _i538.ProductCubit(gh<_i171.ProductUsecase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
