import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late List<int> prodductSize;
  late int selectedSize = 0;

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addCart({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'sizes': selectedSize,
        'company': widget.product['company'],
        'imageUrl': widget.product['imageUrl']
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product added successfully"),
          duration: Durations.medium2,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please a Select a Size"),
          duration: Durations.medium2,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        leading: const BackButton(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'].toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const Spacer(),
          Image.asset(
            widget.product['imageUrl'],
            height: 250,
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(96, 138, 183, 197),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Text(
                  "\$${widget.product['price'].toString()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ((widget.product['sizes']) as List<int>).length,
                    itemBuilder: (context, index) {
                      prodductSize = widget.product['sizes'] as List<int>;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = prodductSize[index];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Chip(
                            backgroundColor: selectedSize == prodductSize[index]
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromARGB(255, 221, 221, 221),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            label: Text(prodductSize[index].toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => onTap(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart),
                      Text(
                        "Add To Cart",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
