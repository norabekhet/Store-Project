import 'package:dio/dio.dart';
import 'package:e_commerse/models/cart_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();
  Future<List<CartModel>> getcarts() async {
    try {
      List<CartModel> cartItem = [];

      final Response response = await dio.get(
        "https://dummyjson.com/carts/user/1",
      );

      for (var cart in response.data["carts"]) {
        for (var product in cart["products"]) {
          cartItem.add(CartModel.fromJson(product));
        }
      }

      return cartItem;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
