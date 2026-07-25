import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';

class CartModel {
  final String id;
  final String cartOwner;
  final List<CartItemModel> items;
  final num totalCartPrice;

  const CartModel({
    required this.id,
    required this.cartOwner,
    required this.items,
    required this.totalCartPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['_id'] as String? ?? '',
      cartOwner: json['cartOwner'] as String? ?? '',
      items:
          (json['products'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalCartPrice: json['totalCartPrice'] as num? ?? 0,
    );
  }
}
