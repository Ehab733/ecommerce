class CartProductModel {
  final String id;
  final String title;
  final String imageCover;
  final double ratingsAverage;

  const CartProductModel({
    required this.id,
    required this.title,
    required this.imageCover,
    required this.ratingsAverage,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        id: json["_id"] as String? ?? '',
        title: json["title"] as String? ?? '',
        imageCover: json["imageCover"] as String? ?? '',
        ratingsAverage: (json["ratingsAverage"] as num?)?.toDouble() ?? 0.0,
      );
}
