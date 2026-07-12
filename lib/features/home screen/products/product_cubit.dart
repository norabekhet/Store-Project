import 'package:e_commerse/features/home%20screen/products/remote_date_source.dart';
import 'package:e_commerse/features/home%20screen/products/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(initialProductState());

  ProducrRemoteDateSource producrRemoteDateSource = ProducrRemoteDateSource();

  Future<void> products() async {
    emit(loadingProductState());
    await producrRemoteDateSource.getProducts().then(
      (val) {
        emit(successProductState(successProduct: val));
      },
      onError: (Error) {
        emit(failureProductState());
      },
    );
  }

  Future<void> getProductsByCategory(int categoryId) async {
    emit(loadingProductState());

    try {
      final products = await producrRemoteDateSource.getProductsByCategory(
        categoryId,
      );

      emit(successProductState(successProduct: products));
    } catch (e) {
      emit(failureProductState());
    }
  }
}
