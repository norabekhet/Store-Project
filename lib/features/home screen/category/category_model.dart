class CategoryModel {
  final String categoryName;
  final int? id;
  final String? slug;

  CategoryModel({required this.categoryName, this.id, this.slug});

  factory CategoryModel.fromCategoryJson(Map<String, dynamic> categoryJson) {
    return CategoryModel(
      categoryName: categoryJson['name'],
      id: categoryJson['id'],
      slug: categoryJson['slug'],
    );
  }
}
