import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio getDio(SharedPreferences sharedPreferences) {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseURL,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = sharedPreferences.getString(CasheConstants.tokenKey);

          if (token != null && token.isNotEmpty) {
            options.headers[APIConstants.tokenKey] = token;
          }

          Logger().d('🚀 API Request: [${options.method}] ${options.path}');
          return handler.next(options);
        },
        onError: (DioException error, handler) {
          Logger().e(
            '❌ API Error [${error.response?.statusCode}]: ${error.response?.data}',
          );

          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}
