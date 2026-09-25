// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    _CartProductModel(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      imageCover: json['imageCover'] as String? ?? '',
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CartProductModelToJson(_CartProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'imageCover': instance.imageCover,
      'ratingsAverage': instance.ratingsAverage,
    };
