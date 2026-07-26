import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';

abstract class WishlistRemoteDataSource {
  Future<WishListResponse> addProductToWishList(String productId);
  Future<WishListResponse> getWishList();
  Future<WishListResponse> removeProductToWishList(String productId);
}
