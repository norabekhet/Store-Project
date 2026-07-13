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

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     context.read<ProductCubit>().products();
  //     context.read<CategoryCubit>().categories();
  //   });
  // }
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
                  'discover',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1A1D1E),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: AppField(
                        controller: TextEditingController(),
                        obscureText: false,
                        hint: "Search for clothes...",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_calendar_outlined,
                        color: AppColors.white,
                      ),
                      style: IconButton.styleFrom(
                        minimumSize: Size(45, 45),
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<CategoryCubit, CategoryStates>(
                  builder: (context, state) {
                    if (state is categoriesLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is categoriessuccessState) {
                      return SizedBox(
                        height: 50,
                        child: ListView.builder(
                          itemCount: state.successCtegory.length,
                          scrollDirection: Axis.horizontal,
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
                    } else if (state is categoriesFailState) {
                      return Text("Error");
                    } else {
                      return SizedBox();
                    }
                  },
                ),
                Expanded(
                  child: BlocBuilder<ProductCubit, ProductStates>(
                    builder: (context, state) {
                      if (state is loadingProductState) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is successProductState) {
                        return GridView.builder(
                          itemCount: state.successProduct.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                        return Center(child: Text("error"));
                      } else {
                        return SizedBox();
                      }
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
