import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeApiRemoteDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  const HomeApiRemoteDataSource(this._dio);
  @override
  Future<CategoryResponse> getCategories() async {
    try {
      final response = await _dio.get(APIConstants.categoriesEndPoint);
      return CategoryResponse.fromJson(response.data);
    } catch (error) {
      String? message;
      if (error is DioException) {
        message = error.response?.data['message'];
      }
      throw RemoteException(message ?? 'An unexpected error occurred');
    }
  }
}
