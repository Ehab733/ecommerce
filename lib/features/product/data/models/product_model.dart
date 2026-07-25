import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/product/data/models/brand_model.dart';

class ProductModel {
  final int sold;
  final List<String> images;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final String imageCover;
  final CategoryModel category;
  final Brand brand;
  final double ratingsAverage;
  final String createdAt;
  final String updatedAt;
  final num? priceAfterDiscount;

  ProductModel({
    required this.sold,
    required this.images,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    this.priceAfterDiscount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    // 1️⃣ تحويل آمن للأرقام الصحيحة
    sold: (json["sold"] as num?)?.toInt() ?? 0,
    quantity: (json["quantity"] as num?)?.toInt() ?? 0,
    price: (json["price"] as num?)?.toInt() ?? 0,
    ratingsQuantity: (json["ratingsQuantity"] as num?)?.toInt() ?? 0,

    // 2️⃣ حل المشكلة الرئيسية: تحويل ratingsAverage لـ double بأمان
    ratingsAverage: (json["ratingsAverage"] as num?)?.toDouble() ?? 0.0,

    priceAfterDiscount: json['priceAfterDiscount'] as num?,

    // 3️⃣ تحويل آمن للـ Strings
    id: json["_id"] as String? ?? '',
    title: json["title"] as String? ?? '',
    slug: json["slug"] as String? ?? '',
    description: json["description"] as String? ?? '',
    imageCover: json["imageCover"] as String? ?? '',
    createdAt: json["createdAt"] as String? ?? '',
    updatedAt: json["updatedAt"] as String? ?? '',

    // 4️⃣ تحويل آمن لقائمة الصور
    images:
        (json["images"] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
        [],

    // 5️⃣ فحص الكائنات الفرعية لتجنب الـ Null Exception
    category: CategoryModel.fromJson(json["category"] as Map<String, dynamic>),
    brand: Brand.fromJson(json["brand"] as Map<String, dynamic>),
  );
}
