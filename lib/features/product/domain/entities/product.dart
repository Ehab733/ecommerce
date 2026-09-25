import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/product/data/models/brand_model.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final int quantity;
  final double price;
  final int sold;
  final List<String> images;
  final int ratingsQuantity;
  final String imageCover;
  final CategoryModel category;
  final Brand brand;
  final double ratingsAverage;
  final double? priceAfterDiscount;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.sold,
    required this.images,
    required this.ratingsQuantity,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    this.priceAfterDiscount,
  });
}
