import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, void>> forgetPassword(String email);
  Future<Either<Failure, void>> codeVerification(String resetCode);
  Future<Either<Failure, void>> resetPassword(String email, String newPassword);
}
