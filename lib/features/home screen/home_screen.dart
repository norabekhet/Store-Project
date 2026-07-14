import 'package:e_commerse/core/helpers/app_colors.dart';
import 'package:e_commerse/core/helpers/app_field.dart';
import 'package:e_commerse/features/home%20screen/category/category_cubit.dart';
import 'package:e_commerse/features/home%20screen/category/category_states.dart';
import 'package:e_commerse/features/home%20screen/custom_category.dart';
import 'package:e_commerse/features/home%20screen/products/custom_product.dart';
import 'package:e_commerse/features/home%20screen/products/product_cubit.dart';
import 'package:e_commerse/models/product_model.dart';
import 'package:e_commerse/features/home%20screen/products/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()..categories()),
        BlocProvider(create: (context) => ProductCubit()..products()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "discover".tr(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1A1D1E),
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: AppField(
                        controller: TextEditingController(),
                        obscureText: false,
                        hint: "search_hint".tr(),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_calendar_outlined,
                        color: AppColors.white,
                      ),
                      style: IconButton.styleFrom(
                        minimumSize: const Size(45, 45),
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),

                BlocBuilder<CategoryCubit, CategoryStates>(
                  builder: (context, state) {
                    if (state is categoriesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is categoriessuccessState) {
                      return SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.successCtegory.length,
                          itemBuilder: (context, index) {
                            return CustomCategory(
                              categoryModel: state.successCtegory[index],
                              index: index,
                              selectedIndex: selectedIndex,
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });

                                if (state.successCtegory[index].id == 0) {
                                  context.read<ProductCubit>().products();
                                } else {
                                  context
                                      .read<ProductCubit>()
                                      .getProductsByCategory(
                                        state.successCtegory[index].id ?? 0,
                                      );
                                }
                              },
                            );
                          },
                        ),
                      );
                    }

                    if (state is categoriesFailState) {
                      return Center(child: Text("error".tr()));
                    }

                    return const SizedBox();
                  },
                ),

                Expanded(
                  child: BlocBuilder<ProductCubit, ProductStates>(
                    builder: (context, state) {
                      if (state is loadingProductState) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is successProductState) {
                        return GridView.builder(
                          itemCount: state.successProduct.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                          itemBuilder: (context, index) {
                            return CustomProduct(
                              productModel: state.successProduct[index],
                            );
                          },
                        );
                      }

                      if (state is failureProductState) {
                        return Center(child: Text("error".tr()));
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
