import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@LazySingleton(as: WishlistRemoteDataSource)
class WishlistApiRemoteDataSource implements WishlistRemoteDataSource {
  final Dio _dio;

  const WishlistApiRemoteDataSource(this._dio);

  @override
  Future<WishListResponse> addProductToWishList(String productId) async {
    try {
      final response = await _dio.post(
        APIConstants.wishlistEndPoint,
        data: {'productId': productId},
      );
      Logger().d(response.data);
      return WishListResponse.fromJson(response.data);
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

  @override
  Future<WishListResponse> getWishList() async {
    try {
      final response = await _dio.get(APIConstants.wishlistEndPoint);
      Logger().d(response.data);
      return WishListResponse.fromJson(response.data);
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

  @override
  Future<WishListResponse> removeProductToWishList(String productId) async {
    try {
      final response = await _dio.delete(
        '${APIConstants.wishlistEndPoint}/$productId',
      );
      Logger().d(response.data);
      return WishListResponse.fromJson(response.data);
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
