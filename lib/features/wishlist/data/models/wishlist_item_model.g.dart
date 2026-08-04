// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishlistItemModel _$WishlistItemModelFromJson(Map<String, dynamic> json) =>
    _WishlistItemModel(
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num).toInt(),
      imageCover: json['imageCover'] as String?,
    );

Map<String, dynamic> _$WishlistItemModelToJson(_WishlistItemModel instance) =>
    <String, dynamic>{
      'images': instance.images,
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'imageCover': instance.imageCover,
    };
