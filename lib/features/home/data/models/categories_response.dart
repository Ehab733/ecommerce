import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/home/data/models/meta_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_response.freezed.dart';
part 'categories_response.g.dart';

@freezed
abstract class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    required int results,
    required MetaData metadata,
    required List<CategoryModel> data,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
