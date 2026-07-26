import 'package:ecommerce/features/wishlist/data/models/wishlist_item_model.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_item.dart';

extension WishlistItemMapper on WishlistItemModel {
  WishlistItem get toEntity => WishlistItem(
    images: images,
    id: id,
    title: title,
    price: price,
    imageCover: imageCover,
  );
}
