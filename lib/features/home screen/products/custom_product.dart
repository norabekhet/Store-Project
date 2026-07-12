import 'package:e_commerse/features/details/details_screen.dart';
import 'package:e_commerse/models/product_model.dart';
import 'package:flutter/material.dart';

class CustomProduct extends StatefulWidget {
  CustomProduct({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen(productModel: widget.productModel);
                },
              ),
            );
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.network(
                  widget.productModel.images[0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      "https://picsum.photos/300/300",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Text(
              widget.productModel.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text("\$${widget.productModel.price}"),
          ],
        ),
      ),
    );
  }
}
