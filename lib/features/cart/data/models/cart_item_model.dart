import 'package:ecommerce/features/cart/data/models/cart_product_model.dart';

class CartItemModel {
  final int count;
  final String id;
  final num price;
  final CartProductModel product;

  const CartItemModel({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      count: (json['count'] as num?)?.toInt() ?? 0,
      id: json['_id'] as String? ?? '',
      product: CartProductModel.fromJson(
        json['product'] as Map<String, dynamic>,
      ),
      price: json['price'] as num? ?? 0,
    );
  }
}
