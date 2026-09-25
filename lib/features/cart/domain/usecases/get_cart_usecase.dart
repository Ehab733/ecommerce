import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/respositories/cart_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetCartUsecase {
  final CartRepository _cartRepository;

  const GetCartUsecase(this._cartRepository);

  Future<Either<Failure, Cart>> call() =>
      _cartRepository.getCart();
}
