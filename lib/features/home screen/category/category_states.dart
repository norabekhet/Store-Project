import 'package:e_commerse/features/home%20screen/category/category_model.dart';

abstract class CategoryStates {}

class initialCategoriesStates extends CategoryStates {}

class categoriesLoadingState extends CategoryStates {}

class categoriesFailState extends CategoryStates {}

class categoriessuccessState extends CategoryStates {
  final List<CategoryModel> successCtegory;
  categoriessuccessState({required this.successCtegory});
}
