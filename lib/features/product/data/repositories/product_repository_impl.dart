import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/data/data_source/remote_data_source/product_remote_data_source.dart';
import 'package:ecommerce/features/product/data/mappers/product_mapper.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  const ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts(String? categoryId) async {
    try {
      final response = await _productRemoteDataSource.getProducts(categoryId);
      return Right(response.data.map((e) => e.toEntity).toList());
    } catch (error) {
      Logger().d(error);
      return Left(ErrorHandler.handle(error));
    }
  }
}
