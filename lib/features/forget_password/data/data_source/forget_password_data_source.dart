import 'package:ecommerce/features/forget_password/data/models/forget_password_response.dart';

abstract class ForgetPasswordDataSource {
  Future<ForgetPasswordResponse> forgetPassword(String email);
  Future<ForgetPasswordResponse> codeVerification(String resetCode);
  Future<ForgetPasswordResponse> resetPassword(String email, String newPassword);
}