import 'package:e_commerse/features/home%20screen/category/category_states.dart';
import 'package:e_commerse/features/home%20screen/products/producr_remote_date_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(initialCategoriesStates());

  ProducrRemoteDateSource remoteDataSource = ProducrRemoteDateSource();

  Future<void> categories() async {
    await remoteDataSource.getCategories().then(
      (val) {
        emit(categoriessuccessState(successCtegory: val));
      },
      onError: (Error) {
        emit(categoriesFailState());
      },
    );
  }
}
