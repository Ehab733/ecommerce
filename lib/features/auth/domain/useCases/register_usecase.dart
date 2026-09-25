import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/models/register/register_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterUsecase {
  final AuthRepository _authRepository;

  const RegisterUsecase(this._authRepository);

  Future<Either<Failure, User>> call(RegisterRequest request) =>
      _authRepository.register(request);
}
