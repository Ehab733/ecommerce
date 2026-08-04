import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/features/forget_password/data/data_source/forget_password_data_source.dart';
import 'package:ecommerce/features/forget_password/data/models/forget_password_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ForgetPasswordDataSource)
class ForgetPasswordApiDataSource extends ForgetPasswordDataSource {
  final Dio _dio;

  ForgetPasswordApiDataSource(this._dio);

  @override
  Future<ForgetPasswordResponse> forgetPassword(String email) async {
    try {
      final response = await _dio.post(
        APIConstants.forgetPasswordEndPoint,
        data: {'email': email},
      );
      return ForgetPasswordResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ForgetPasswordResponse> codeVerification(String resetCode) async {
    try {
      final response = await _dio.post(
        APIConstants.verifyResetCodeEndPoint,
        data: {'resetCode': resetCode},
      );
      return ForgetPasswordResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ForgetPasswordResponse> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      final response = await _dio.put(
        APIConstants.resetPasswordEndPoint,
        data: {'email': email, 'newPassword': newPassword},
      );
      return ForgetPasswordResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
