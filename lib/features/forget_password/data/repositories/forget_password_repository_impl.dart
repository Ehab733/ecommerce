import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/forget_password/data/data_source/forget_password_data_source.dart';
import 'package:ecommerce/features/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordDataSource _dataSource;

  ForgetPasswordRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      await _dataSource.forgetPassword(email);
      return const Right(null);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<Failure, void>> codeVerification(String resetCode) async {
    try {
      await _dataSource.codeVerification(resetCode);
      return const Right(null);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      await _dataSource.resetPassword(email, newPassword);
      return const Right(null);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
