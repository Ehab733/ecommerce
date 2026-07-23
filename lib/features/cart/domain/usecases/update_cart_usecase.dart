import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/respositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateCartUsecase {
  final CartRepository _cartRepository;

  const UpdateCartUsecase(this._cartRepository);

  Future<Either<Failure, Cart>> call(String productId, int quantity) =>
      _cartRepository.updateCart(productId, quantity);
}
