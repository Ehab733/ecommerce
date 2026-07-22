class Brand {
  final String id;
  final String name;
  final String slug;
  final String image;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
  );
}
