import 'package:ecommerce/features/wishlist/data/models/wishlist_item_model.dart';

class WishListResponse {
  final String status;
  final int? count;
  final String message;
  final List<WishlistItemModel>? wishlistItem;
  final List<String>? items;

  WishListResponse({
    required this.status,
    this.count,
    required this.message,
    this.wishlistItem,
    this.items,
  });

  factory WishListResponse.fromJson(Map<String, dynamic> json) {
    List<WishlistItemModel>? wishlistItemsList;
    List<String>? itemsList;

    // 🎯 فحص ذكي لنوع البيانات داخل قائمة data
    if (json["data"] != null && json["data"] is List) {
      final dataList = json["data"] as List;

      if (dataList.isNotEmpty) {
        // 1️⃣ لو العناصر Maps (عند جلب المفضلة GET)
        if (dataList.first is Map<String, dynamic>) {
          wishlistItemsList = dataList
              .map((e) => WishlistItemModel.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        // 2️⃣ لو العناصر Strings / IDs (عند الإضافة أو الحذف POST / DELETE)
        else if (dataList.first is String) {
          itemsList = List<String>.from(dataList);
        }
      } else {
        wishlistItemsList = [];
      }
    }

    // 🎯 قراءة الـ categories أو الـ items إن وجدت
    if (json["categories"] != null && json["categories"] is List) {
      itemsList = List<String>.from(json["categories"]);
    }

    return WishListResponse(
      status: json["status"] ?? '',
      count: json["count"],
      message: json["message"] ?? '',
      wishlistItem: wishlistItemsList,
      items: itemsList,
    );
  }
}
