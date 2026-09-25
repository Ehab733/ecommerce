import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_item.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserWishlistUsecase {
  final WishlistRepository _wishlistRepository;

  const GetUserWishlistUsecase(this._wishlistRepository);

  Future<Either<Failure, List<WishlistItem>>> call() =>
      _wishlistRepository.getWishList();
}
