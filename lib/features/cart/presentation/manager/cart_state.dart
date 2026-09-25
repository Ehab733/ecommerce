import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _initial;

  // add
  const factory CartState.addToCartLoading({required String productId}) =
      _addToCartLoading;
  const factory CartState.addToCartError({
    required String errorMessage,
    required String productId,
  }) = _addToCartError;
  const factory CartState.addToCartSuccess({required String productId}) =
      _addToCartSuccess;

  // get
  const factory CartState.getCartLoading() = _getCartLoading;
  const factory CartState.getCartError({required String errorMessage}) =
      _getCartError;
  const factory CartState.getCartSuccess() = _getCartSuccess;

  // update
  const factory CartState.updateCartLoading() = _updateCartLoading;
  const factory CartState.updateCartError({required String errorMessage}) =
      _updateCartError;
  const factory CartState.updateCartSuccess() = _updateCartSuccess;

  //delete
  const factory CartState.deleteFromCartLoading() = _deleteFromCartLoading;
  const factory CartState.deleteFromCartError({required String errorMessage}) =
      _deleteFromCartError;
  const factory CartState.deleteFromCartSuccess() = _deleteFromCartSuccess;
}
