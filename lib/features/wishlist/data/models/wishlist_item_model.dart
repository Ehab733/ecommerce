class WishlistItemModel {
  List<String> images;
  String id;
  String title;
  int price;
  String imageCover;

  WishlistItemModel({
    required this.images,
    required this.id,
    required this.title,
    required this.price,
    required this.imageCover,
  });

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) => WishlistItemModel(
    images: List<String>.from(json["images"]),
    id: json["_id"],
    title: json["title"],
    price: json["price"],
    imageCover: json["imageCover"],
  );
}
