class CategoryModel {
  final String id;
  final String name;
  final String slug;
  final String image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['_id'],
    name: json['name'],
    slug: json['slug'],
    image: json['image'],
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}
