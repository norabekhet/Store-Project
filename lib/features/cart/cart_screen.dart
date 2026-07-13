import 'package:e_commerse/core/helpers/app_colors.dart';
import 'package:e_commerse/features/cart/cart_cubit.dart';
import 'package:e_commerse/features/cart/cart_item_widget.dart';
import 'package:e_commerse/main_screen.dart';
import 'package:e_commerse/models/cart_model.dart';
import 'package:e_commerse/features/cart/cart_price_row.dart';
import 'package:e_commerse/features/cart/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..carts(),
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: SafeArea(
          child: BlocBuilder<CartCubit, CartStates>(
            builder: (context, state) {
              final cubit = context.read<CartCubit>();

              if (state is loadingcart) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is failurecart) {
                return const Center(child: Text("Error"));
              }

              if (state is successcart) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MainScreen();
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            const Expanded(
                              child: Text(
                                "My Cart",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 48),
                          ],
                        ),
                      ),

                      Expanded(
                        child: ListView.builder(
                          itemCount: state.succesList.length,
                          itemBuilder: (context, index) {
                            return CartItemWidget(
                              cartModel: state.succesList[index],
                              index: index,
                            );
                          },
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CartPriceRow(
                              title: "Sub-total",
                              value: cubit.subTotal,
                            ),

                            const SizedBox(height: 12),

                            CartPriceRow(title: "VAT", value: cubit.vat),

                            const SizedBox(height: 12),

                            CartPriceRow(
                              title: "Shipping",
                              value: cubit.shipping,
                            ),

                            const Divider(height: 30),

                            CartPriceRow(title: "Total", value: cubit.total),

                            const SizedBox(height: 20),

                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  "Go To Checkout",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
