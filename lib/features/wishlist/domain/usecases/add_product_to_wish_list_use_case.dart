import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProductToWishListUseCase {
  final WishlistRepository _wishlistRepository;

  const AddProductToWishListUseCase(this._wishlistRepository);

  Future<Either<Failure, List<String>>> call(String productId) =>
      _wishlistRepository.addProductToWishList(productId);
}
