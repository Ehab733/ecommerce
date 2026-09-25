import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/models/login/login_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginUsecase {
  final AuthRepository _authRepository;

  const LoginUsecase(this._authRepository);

  Future<Either<Failure, User>> call(LoginRequest request) =>
      _authRepository.login(request);
}
