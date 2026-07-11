class ProductModel {
  final String productName;
  final String price;
  final String imagePath;
  final int? id;

  ProductModel({
    required this.productName,
    required this.price,
    required this.imagePath,
    this.id,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imagePath: json['category']['image'],
      productName: json['title'],
      price: json['price'].toString(),
      id: json['id'],
    );
  }
}
