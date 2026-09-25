import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/features/cart/data/data_source/remote_data_source/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;
  const CartApiRemoteDataSource(this._dio);

  @override
  Future<void> addProductToCart(String productId) async {
    try {
      final response = await _dio.post(
        APIConstants.cartEndPoint,
        data: {'productId': productId},
      );
      Logger().d(response.statusCode);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<CartResponse> getCart() async {
    try {
      final response = await _dio.get(APIConstants.cartEndPoint);
      Logger().i(response.data);
      return CartResponse.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<CartResponse> deleteFormCart(String productId) async {
    try {
      final response = await _dio.delete(
        '${APIConstants.cartEndPoint}/$productId',
      );
      Logger().i(response.data);
      return CartResponse.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<CartResponse> updateCart(String productId, int quantity) async {
    try {
      final response = await _dio.put(
        '${APIConstants.cartEndPoint}/$productId',
        data: {'count': quantity},
      );
      Logger().i(response.data);
      return CartResponse.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
