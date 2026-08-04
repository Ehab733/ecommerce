// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartModel _$CartModelFromJson(Map<String, dynamic> json) => _CartModel(
  id: json['_id'] as String? ?? '',
  cartOwner: json['cartOwner'] as String? ?? '',
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalCartPrice: (json['totalCartPrice'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$CartModelToJson(_CartModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cartOwner': instance.cartOwner,
      'products': instance.products,
      'totalCartPrice': instance.totalCartPrice,
    };
