import 'package:ecommerce/features/cart/data/models/cart_model.dart';

class CartResponse {
  final String status;
  final String message;
  final int numOfCartItems;
  final String cartId;
  final CartModel cartModel;

  const CartResponse({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.cartId,
    required this.cartModel,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt() ?? 0,
      cartId: json['cartId'] as String? ?? '',
      cartModel: CartModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
