import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/mappers/user_mappers.dart';
import 'package:ecommerce/features/auth/data/models/login/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register/register_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  const AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, User>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSource.login(request);
      await _localDataSource.setToken(response.token);
      Logger().d(response.token);
      Logger().d(response.user.toEntity);
      return Right(response.user.toEntity);
    } on AppException catch (error) {
      Logger().d(error.message);
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, User>> register(RegisterRequest request) async {
    try {
      final response = await _remoteDataSource.register(request);
      await _localDataSource.setToken(response.token);
      Logger().d(response.token);
      Logger().d(response.user.toEntity);
      return Right(response.user.toEntity);
    } on AppException catch (error) {
      Logger().d(error.message);
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async{
    try {
      
      await _localDataSource.deleteToken();
     
      return const Right(null);
    } on AppException catch (error) {
      Logger().d(error.message);
      return Left(Failure(error.message));
    }
  }
}
