part of 'product_cubit.dart';

sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

final class GetProductError extends GetProductState {
  final String message;

  GetProductError(this.message);
}

final class GetProductSuccess extends GetProductState {
  final List<Product> products;

  GetProductSuccess(this.products);
}

final class QuantityChanged extends GetProductState {}