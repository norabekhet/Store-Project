import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerse/core/helpers/app_colors.dart';
import 'package:e_commerse/core/helpers/app_toast.dart';
import 'package:e_commerse/features/cart/cart_screen.dart';
import 'package:e_commerse/models/product_model.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text(
            "discover".tr(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff1A1D1E),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  widget.productModel.images[0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 275,
                ),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productModel.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 13),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 227, 147, 17),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "4.6",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text("(20 ${"reviews".tr()})"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13),

              Text(
                widget.productModel.description ?? "",
                style: TextStyle(color: Colors.grey.shade500),
              ),

              const Spacer(),
              const Divider(),

              Row(
                children: [
                  Text(
                    "\$${widget.productModel.price}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1A1D1E),
                    ),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        showSnackBar(
                          msg: "added_to_cart".tr(),
                          type: AnimatedSnackBarType.success,
                          context: context,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3B71CA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "add_to_cart".tr(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
