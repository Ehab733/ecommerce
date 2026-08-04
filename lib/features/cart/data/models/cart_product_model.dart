import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_model.freezed.dart';
part 'cart_product_model.g.dart';

@freezed
abstract class CartProductModel with _$CartProductModel {
  const factory CartProductModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') String title,
    @Default('') String imageCover,
    @Default(0.0) double ratingsAverage,
  }) = _CartProductModel;

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);
}