import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_response.freezed.dart';
part 'wishlist_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class WishListResponse<T> with _$WishListResponse<T> {
  const factory WishListResponse({
    required String status,
    required int? count,
    required String? message,
    required List<T>? data,
  }) = _WishListResponse<T>;

  factory WishListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$WishListResponseFromJson(json, fromJsonT);
}
