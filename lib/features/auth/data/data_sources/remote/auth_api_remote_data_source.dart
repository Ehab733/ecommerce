import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register/register_response.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio;
  const AuthApiRemoteDataSource(this._dio);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        APIConstants.loginEndPoint,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } on DioException catch (error) {
      String? message;

      // 1️⃣ فحص جميع المسميات الشائعة لرسائل الخطأ من الـ API
      if (error.response?.data is Map) {
        final data = error.response!.data as Map<String, dynamic>;
        message = data['message'] ?? data['statusMsg'] ?? data['error'];
      }

      Logger().e("DioError: ${error.response?.statusCode} -> $message");
      throw RemoteException(
        message ?? error.message ?? 'حدث خطأ في الاتصال بالشبكة',
      );
    } catch (error, stackTrace) {
      // 2️⃣ طباعة خطأ الـ Parsing الحقيقي في الـ Console مع الـ StackTrace
      Logger().e(
        "Parsing/Model Error: $error",
        error: error,
        stackTrace: stackTrace,
      );
      throw RemoteException('حدث خطأ أثناء تحويل البيانات: $error');
    }
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post(
        APIConstants.registerEndPoint,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } on DioException catch (error) {
      String? message;

      // 1️⃣ فحص جميع المسميات الشائعة لرسائل الخطأ من الـ API
      if (error.response?.data is Map) {
        final data = error.response!.data as Map<String, dynamic>;
        message = data['message'] ?? data['statusMsg'] ?? data['error'];
      }

      Logger().e("DioError: ${error.response?.statusCode} -> $message");
      throw RemoteException(
        message ?? error.message ?? 'حدث خطأ في الاتصال بالشبكة',
      );
    } catch (error, stackTrace) {
      // 2️⃣ طباعة خطأ الـ Parsing الحقيقي في الـ Console مع الـ StackTrace
      Logger().e(
        "Parsing/Model Error: $error",
        error: error,
        stackTrace: stackTrace,
      );
      throw RemoteException('حدث خطأ أثناء تحويل البيانات: $error');
    }
  }
}
