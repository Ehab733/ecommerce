import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/product/data/data_source/remote_data_source/product_remote_data_source.dart';
import 'package:ecommerce/features/product/data/models/product_response.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteApiDataSource implements ProductRemoteDataSource {
  final Dio _dio;

  const ProductRemoteApiDataSource(this._dio);

  @override
  Future<ProductResponse> getProducts(String? categoryId) async {
    try {
      final response = await _dio.get(
        APIConstants.productsEndPoint,
        queryParameters: {
          if (categoryId != null && categoryId.isNotEmpty)
            'category': categoryId,
        },
      );
      Logger().d(response.data);
      return ProductResponse.fromJson(response.data);
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
