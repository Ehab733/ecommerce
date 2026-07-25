import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
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
    } on DioException catch (error) {
      String? message;

      if (error.response?.data is Map) {
        final data = error.response!.data as Map<String, dynamic>;
        message = data['message'] ?? data['statusMsg'] ?? data['error'];
      }

      Logger().e("DioError: ${error.response?.statusCode} -> $message");
      throw RemoteException(
        message ?? error.message ?? 'A network connection error occurred.',
      );
    } catch (error, stackTrace) {
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

  @override
  Future<CartResponse> getCart() async {
    try {
      final response = await _dio.get(APIConstants.cartEndPoint);
      Logger().d(response.data);
      return CartResponse.fromJson(response.data);
    } on DioException catch (error) {
      String? message;

      if (error.response?.data is Map) {
        final data = error.response!.data as Map<String, dynamic>;
        message = data['message'] ?? data['statusMsg'] ?? data['error'];
      }

      Logger().e("DioError: ${error.response?.statusCode} -> $message");
      throw RemoteException(
        message ?? error.message ?? 'A network connection error occurred.',
      );
    } catch (error, stackTrace) {
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

  @override
  Future<CartResponse> deleteFormCart(String productId) async {
    try {
      final response = await _dio.delete(
        '${APIConstants.cartEndPoint}/$productId',
      );
      Logger().d(response.data);
      return CartResponse.fromJson(response.data);
    } on DioException catch (error) {
      String? message;

      if (error.response?.data is Map) {
        final data = error.response!.data as Map<String, dynamic>;
        message = data['message'] ?? data['statusMsg'] ?? data['error'];
      }

      Logger().e("DioError: ${error.response?.statusCode} -> $message");
      throw RemoteException(
        message ?? error.message ?? 'A network connection error occurred.',
      );
    } catch (error, stackTrace) {
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

  @override
  Future<CartResponse> updateCart(String productId, int quantity) async {
    try {
      final response = await _dio.put(
        '${APIConstants.cartEndPoint}/$productId',
        data: {'count': quantity},
      );
      Logger().d(response.data);
      return CartResponse.fromJson(response.data);
    } on DioException catch (error) {
      String? message;

      if (error.response?.data is Map) {
        final data = error.response!.data as Map<String, dynamic>;
        message = data['message'] ?? data['statusMsg'] ?? data['error'];
      }

      Logger().e("DioError: ${error.response?.statusCode} -> $message");
      throw RemoteException(
        message ?? error.message ?? 'A network connection error occurred.',
      );
    } catch (error, stackTrace) {
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
