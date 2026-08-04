import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/product/data/models/brand_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int sold,
    required List<String> images,
    required int ratingsQuantity,
    @JsonKey(name: '_id') required String id,
    required String title,
    required String slug,
    required String description,
    required int quantity,
    required int price,
    required String imageCover,
    required CategoryModel category,
    required Brand brand,
    required double ratingsAverage,
    required String createdAt,
    required String updatedAt,
    required double? priceAfterDiscount,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
