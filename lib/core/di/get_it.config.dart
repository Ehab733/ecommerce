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
import 'package:ecommerce/features/auth/presentation/manager/auth/auth_cubit.dart'
    as _i595;
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
import 'package:ecommerce/features/home/presentation/manager/cubit/home_cubit.dart'
    as _i989;
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
    gh.lazySingleton<_i572.HomeRepository>(
      () => _i1028.HomeRepositoryImpl(gh<_i488.HomeRemoteDataSource>()),
    );
    gh.singleton<_i395.AuthLocalDataSource>(
      () => _i258.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i713.CategoryUsecase>(
      () => _i713.CategoryUsecase(gh<_i572.HomeRepository>()),
    );
    gh.singleton<_i33.AuthRepository>(
      () => _i689.AuthRepositoryImpl(
        gh<_i385.AuthRemoteDataSource>(),
        gh<_i395.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i989.HomeCubit>(
      () => _i989.HomeCubit(gh<_i713.CategoryUsecase>()),
    );
    gh.singleton<_i186.LoginUsecase>(
      () => _i186.LoginUsecase(gh<_i33.AuthRepository>()),
    );
    gh.singleton<_i471.RegisterUsecase>(
      () => _i471.RegisterUsecase(gh<_i33.AuthRepository>()),
    );
    gh.singleton<_i595.AuthCubit>(
      () => _i595.AuthCubit(
        loginUsecase: gh<_i186.LoginUsecase>(),
        registerUsecase: gh<_i471.RegisterUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
