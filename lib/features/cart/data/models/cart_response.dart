import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
abstract class CartResponse with _$CartResponse {
  const factory CartResponse({
    required String status,
    required int numOfCartItems,
    String? cartId,
    required CartModel data,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}
