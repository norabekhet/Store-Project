import 'package:dio/dio.dart';
import 'package:e_commerse/features/home%20screen/category/category_model.dart';
import 'package:e_commerse/features/home%20screen/products/product_model.dart';

class ProducrRemoteDateSource {
  final Dio dio = Dio();
  Future<List<ProductModel>> getProducts() async {
    try {
      List<ProductModel> productItem = [];
      final Response response = await dio.get(
        "https://api.escuelajs.co/api/v1/products",
      );
      for (var element in response.data) {
        final ProductModel product = ProductModel.fromJson(element);
        productItem.add(product);
      }
      return productItem;
    } on Exception {
      throw Exception("");
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> caregoryIteams = [];
    final Response response = await dio.get(
      'https://api.escuelajs.co/api/v1/categories',
    );
    for (var element in response.data) {
      final CategoryModel caregoryIteam = CategoryModel.fromCategoryJson(
        element,
      );
      caregoryIteams.add(caregoryIteam);
    }
    return caregoryIteams;
  }
}
