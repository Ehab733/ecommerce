import 'package:ecommerce/features/product/data/models/product_response.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponse> getProducts(String? categoryId);
}
