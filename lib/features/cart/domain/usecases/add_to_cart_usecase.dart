import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/respositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToCartUsecase {
  final CartRepository _cartRepository;

  const AddToCartUsecase(this._cartRepository);

  Future<Either<Failure, void>> call(String productId) =>
      _cartRepository.addProductToCart(productId);
}
