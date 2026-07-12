import 'package:e_commerse/core/helpers/app_colors.dart';
import 'package:e_commerse/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({
    super.key,
    required this.categoryModel,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  final CategoryModel categoryModel;
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: selectedIndex == index ? AppColors.primary : AppColors.white,
          ),
          child: Text(
            categoryModel.categoryName,
            style: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
