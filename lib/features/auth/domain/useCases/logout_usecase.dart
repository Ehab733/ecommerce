import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class LogoutUsecase {
  final AuthRepository _authRepository;

  const LogoutUsecase(this._authRepository);

  Future<Either<Failure, void>> call() =>
      _authRepository.logout();
}