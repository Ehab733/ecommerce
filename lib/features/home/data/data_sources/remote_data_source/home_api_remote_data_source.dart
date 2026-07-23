import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeApiRemoteDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  const HomeApiRemoteDataSource(this._dio);
  @override
  Future<CategoryResponse> getCategories() async {
    try {
      final response = await _dio.get(APIConstants.categoriesEndPoint);
      return CategoryResponse.fromJson(response.data);
    } on DioException catch (error) {
      String? message;

      // 1️⃣ فحص جميع المسميات الشائعة لرسائل الخطأ من الـ API
      if (error.response?.data is Map) {
        final data = error.response!.data as Map<String, dynamic>;
        message = data['message'] ?? data['statusMsg'] ?? data['error'];
      }

      Logger().e("DioError: ${error.response?.statusCode} -> $message");
      throw RemoteException(
        message ?? error.message ?? 'A network connection error occurred.',
      );
    } catch (error, stackTrace) {
      // 2️⃣ طباعة خطأ الـ Parsing الحقيقي في الـ Console مع الـ StackTrace
      Logger().e(
        "Parsing/Model Error: $error",
        error: error,
        stackTrace: stackTrace,
      );
      throw RemoteException(
        'An error occurred while converting the data: $error',
      );
    }
  }
}
