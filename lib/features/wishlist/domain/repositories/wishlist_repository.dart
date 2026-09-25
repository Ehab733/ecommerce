import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_item.dart';

abstract class WishlistRepository {
  Future<Either<Failure, List<String>>> addProductToWishList(String productId);
  Future<Either<Failure, List<WishlistItem>>> getWishList();
  Future<Either<Failure, List<String>>> removeProductToWishList(
    String productId,
  );
}
