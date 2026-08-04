import 'package:ecommerce/features/cart/data/models/cart_product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
abstract class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    @Default(0) int count,
    @Default('') @JsonKey(name: '_id') String id,
    required CartProductModel product,
    @Default(0.0) double price,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}