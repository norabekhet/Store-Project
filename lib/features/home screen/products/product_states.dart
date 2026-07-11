import 'package:e_commerse/features/home%20screen/products/product_model.dart';

abstract class ProductStates {}

class initialProductState extends ProductStates {}

class loadingProductState extends ProductStates {}

class failureProductState extends ProductStates {}

class successProductState extends ProductStates {
  final List<ProductModel> successProduct;
  successProductState({required this.successProduct});
}
