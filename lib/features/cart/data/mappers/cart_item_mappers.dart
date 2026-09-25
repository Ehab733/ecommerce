import 'package:ecommerce/features/cart/data/mappers/cart_product_mapper.dart';
import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_data.dart';

extension CartItemMappers on CartItemModel {
  CartItemData get toEntity => CartItemData(
    count: count,
    id: id,
    product: product.toEntity,
    price: price,
  );
}
