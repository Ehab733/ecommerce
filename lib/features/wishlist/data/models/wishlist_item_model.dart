import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_item_model.freezed.dart';
part 'wishlist_item_model.g.dart';

@freezed
abstract class WishlistItemModel with _$WishlistItemModel {
  const factory WishlistItemModel({
    required List<String> images,
    required String? id,
    required String? title,
    required int price,
    required String? imageCover,
  }) = _WishlistItemModel;

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemModelFromJson(json);
}
