import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

@freezed
abstract class Brand with _$Brand {
  const factory Brand({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String slug,
    required String image,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
