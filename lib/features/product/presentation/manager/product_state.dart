import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class GetProductState with _$GetProductState {
  const factory GetProductState.initial() = _inital;
  const factory GetProductState.loading() = _loading;
  const factory GetProductState.error({required String message}) = _error;
  const factory GetProductState.success({required List<Product> products}) =
      _success;
  const factory GetProductState.quantityChanged({required int quantity}) = _quantityChanged;
}
