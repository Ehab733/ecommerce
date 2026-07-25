import 'package:ecommerce/features/cart/domain/entities/cart_item_data.dart';

class Cart {
  final List<CartItemData> items;
  final num totalCartPrice;

  const Cart({required this.items, required this.totalCartPrice});
}
