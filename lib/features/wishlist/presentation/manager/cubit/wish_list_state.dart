
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_list_state.freezed.dart';

@freezed
class WishListState with _$WishListState{
  const factory WishListState.initial() = _initial;

  // Add Product to wishlist states

  const factory WishListState.addProductToWishListLoading() = _addProductToWishListLoading;
  const factory WishListState.addProductToWishListError({required String message}) = _addProductToWishListError;
  const factory WishListState.addProductToWishListSuccess() = _addProductToWishListSuccess;

  // Get wishlist products

  const factory WishListState.getWishListLoading() = _getWishListLoading;
  const factory WishListState.getWishListError({required String message}) = _getWishListError;
  const factory WishListState.getWishListSuccess() = _getWishListSuccess;

  // delete wishlist product

  const factory WishListState.deleteProductFromWishListLoading() = _deleteProductFromWishListLoading;
  const factory WishListState.deleteProductFromWishListError({required String message}) = _deleteProductFromWishListError;
  const factory WishListState.deleteProductFromWishListSuccess() = _deleteProductFromWishListSuccess;


}

