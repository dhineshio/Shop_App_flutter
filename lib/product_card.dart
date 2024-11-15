import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productTitle;
  final String prodductPrice;
  final String productImage;
  const ProductCard(
      {super.key,
      required this.productTitle,
      required this.prodductPrice,
      required this.productImage});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(96, 138, 183, 197),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "\$ $prodductPrice",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Center(
            child: Image.asset(
              productImage,
              width: 250,
              height: 250,
            ),
          )
        ],
      ),
    );
  }
}
