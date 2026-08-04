// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(
  Map<String, dynamic> json,
) => _ProductModel(
  sold: (json['sold'] as num).toInt(),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  ratingsQuantity: (json['ratingsQuantity'] as num).toInt(),
  id: json['_id'] as String,
  title: json['title'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String,
  quantity: (json['quantity'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  imageCover: json['imageCover'] as String,
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  brand: Brand.fromJson(json['brand'] as Map<String, dynamic>),
  ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'sold': instance.sold,
      'images': instance.images,
      'ratingsQuantity': instance.ratingsQuantity,
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'imageCover': instance.imageCover,
      'category': instance.category,
      'brand': instance.brand,
      'ratingsAverage': instance.ratingsAverage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'priceAfterDiscount': instance.priceAfterDiscount,
    };
