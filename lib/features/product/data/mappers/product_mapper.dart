import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';

extension ProductMapper on ProductModel {
  Product get toEntity => Product(
    id: id,
    title: title,
    description: description,
    quantity: quantity,
    price: price,
    sold: sold,
    images: images,
    ratingsQuantity: ratingsQuantity,
    imageCover: imageCover,
    category: category,
    brand: brand,
    ratingsAverage: ratingsAverage,
  );
}
