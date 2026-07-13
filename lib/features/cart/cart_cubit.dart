import 'package:e_commerse/models/cart_model.dart';
import 'package:e_commerse/features/cart/cart_states.dart';
import 'package:e_commerse/features/cart/remote_data_source.dart';
import 'package:e_commerse/features/home%20screen/products/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(initialcart());

  final RemoteDataSource remoteDataSource = RemoteDataSource();

  List<CartModel> cartsList = [];

  Future<void> carts() async {
    emit(loadingcart());

    try {
      cartsList = await remoteDataSource.getcarts();
      emit(successcart(succesList: List.from(cartsList)));
    } catch (e) {
      emit(failurecart());
    }
  }

  void increaseQuantity(int index) {
    cartsList[index].quantity++;

    emit(successcart(succesList: List.from(cartsList)));
  }

  void decreaseQuantity(int index) {
    if (cartsList[index].quantity > 1) {
      cartsList[index].quantity--;

      emit(successcart(succesList: List.from(cartsList)));
    }
  }

  double get subTotal {
    double total = 0;

    for (var item in cartsList) {
      total += item.price * item.quantity;
    }

    return total;
  }

  double get vat => subTotal * 0.14;

  double get shipping => 80;

  double get total => subTotal + vat + shipping;
}
