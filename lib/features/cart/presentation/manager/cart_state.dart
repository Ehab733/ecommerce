part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

// add

final class AddToCartLoading extends CartState {
  final String productId;

  AddToCartLoading(this.productId);
}

final class AddToCartError extends CartState {
  final String productId;

  final String message;
  AddToCartError(this.message, this.productId);
}

final class AddToCartSuccess extends CartState {
  final String productId;
  AddToCartSuccess(this.productId);
}

// get

final class GetCartLoading extends CartState {}

final class GetCartError extends CartState {
  final String message;
  GetCartError(this.message);
}

final class GetCartSuccess extends CartState {}

// update
final class UpdateCartLoading extends CartState {}

final class UpdateCartError extends CartState {
  final String message;
  UpdateCartError(this.message);
}

final class UpdateCartSuccess extends CartState {}

// delete
final class DeleteFromCartLoading extends CartState {}

final class DeleteFromCartError extends CartState {
  final String message;
  DeleteFromCartError(this.message);
}

final class DeleteFromCartSuccess extends CartState {}
