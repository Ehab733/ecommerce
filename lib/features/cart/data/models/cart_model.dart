import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
abstract class CartModel with _$CartModel {
  const factory CartModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') String cartOwner,
    @Default([]) List<CartItemModel> products,
    @Default(0.0) double totalCartPrice,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
