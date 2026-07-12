import 'package:e_commerse/features/account/account_screen.dart';
import 'package:e_commerse/features/auth/login_screen.dart';
import 'package:e_commerse/features/auth/sign_up.dart';
import 'package:e_commerse/features/cart/cart_screen.dart';
import 'package:e_commerse/features/home%20screen/category/category_cubit.dart';
import 'package:e_commerse/features/home%20screen/home_screen.dart';
import 'package:e_commerse/features/home%20screen/products/product_cubit.dart';
import 'package:e_commerse/features/location/location_screen.dart';
import 'package:e_commerse/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(E_commerce());
}

class E_commerce extends StatelessWidget {
  const E_commerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: //AddScreen(),
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ProductCubit()),
          BlocProvider(create: (context) => CategoryCubit()),
        ],
        child: MainScreen(),
      ),
    );
  }
}
