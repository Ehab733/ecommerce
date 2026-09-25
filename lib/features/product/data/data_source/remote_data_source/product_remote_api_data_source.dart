import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
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
    } on DioException catch (_) {
      rethrow;
    }
  }
}
