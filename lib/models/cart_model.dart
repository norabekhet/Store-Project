class CartModel {
  final String title;
  final String subtitle;
  final double price;
  final String image;
  int quantity;

  CartModel({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      title: json['title'],
      subtitle: json['title'],
      price: (json['price'] as num).toDouble(),
      image: json['thumbnail'],
      quantity: json['quantity'],
    );
  }
}
