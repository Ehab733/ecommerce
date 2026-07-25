import 'package:ecommerce/features/home/data/models/meta_data.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';

class ProductResponse {
  final int results;
  final Metadata metadata;
  final List<ProductModel> products;

  ProductResponse({
    required this.results,
    required this.metadata,
    required this.products,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        results: json["results"] as int,
        metadata: Metadata.fromJson(json["metadata"] as Map<String, dynamic>),
        products: (json["data"] as List<dynamic>)
            .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
