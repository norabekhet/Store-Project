import 'package:flutter/material.dart';

class CartPriceRow extends StatelessWidget {
  const CartPriceRow({super.key, required this.title, required this.value});

  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff808080),
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "\$ ${value.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
