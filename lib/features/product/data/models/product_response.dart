import 'package:ecommerce/features/home/data/models/meta_data.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
abstract class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    required int results,
    required MetaData metadata,
    required List<ProductModel> data,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
