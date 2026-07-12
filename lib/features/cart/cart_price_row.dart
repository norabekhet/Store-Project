import 'package:flutter/material.dart';

class CartPriceRow extends StatelessWidget {
  const CartPriceRow({
    super.key,
    required this.title,
    required this.value,
    this.isBold = false,
  });

  final String title;
  final double value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          "\$ ${value.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
