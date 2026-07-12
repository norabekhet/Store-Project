class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String categoryName;
  final List<String> images;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryName,
    required this.price,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      categoryName: json['category']['name'],
      price: json['price'],
      images: List<String>.from(json['images']),
    );
  }
}
