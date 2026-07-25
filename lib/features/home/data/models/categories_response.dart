import 'package:ecommerce/features/home/data/models/category_model.dart';
import 'package:ecommerce/features/home/data/models/meta_data.dart';

class CategoryResponse {
  final int results;
  final Metadata metadata;
  final List<CategoryModel> categories;

  const CategoryResponse({
    required this.results,
    required this.metadata,
    required this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      results: json['results'],
      metadata: Metadata.fromJson(json['metadata']),

      categories: (json['data'] as List)
          .map((i) => CategoryModel.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }
}
