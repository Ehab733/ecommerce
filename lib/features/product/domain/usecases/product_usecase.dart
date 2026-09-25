import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductUsecase {
  final ProductRepository _productRepository;

  const ProductUsecase(this._productRepository);

  Future<Either<Failure, List<Product>>> call(String? categoryId) =>
      _productRepository.getProducts(categoryId);
}
