part of 'wish_list_cubit.dart';

sealed class WishListState {}

final class WishListInitial extends WishListState {}

// Add Product to wishlist states
final class AddProductToWishListLoading extends WishListState {}

final class AddProductToWishListError extends WishListState {
  final String message;
  AddProductToWishListError(this.message);
}

final class AddProductToWishListSuccess extends WishListState {}


// Get wishlist products
final class GetWishListLoading extends WishListState {}

final class GetWishListError extends WishListState {
  final String message;
  GetWishListError(this.message);
}

final class GetWishListSuccess extends WishListState {}


// delete wishlist product
final class DeleteProductFromWishListLoading extends WishListState {}

final class DeleteProductFromWishListError extends WishListState {
  final String message;
  DeleteProductFromWishListError(this.message);
}

final class DeleteProductFromWishListSuccess extends WishListState {}
