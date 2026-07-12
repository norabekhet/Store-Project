import 'package:e_commerse/models/cart_model.dart';

abstract class CartStates {}

class initialcart extends CartStates {}

class loadingcart extends CartStates {}

class failurecart extends CartStates {}

class successcart extends CartStates {
  final List<CartModel> succesList;
  successcart({required this.succesList});
}
