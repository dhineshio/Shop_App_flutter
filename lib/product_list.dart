import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<String> filters = [
    "All",
    "Adidas",
    "Puma",
    "VKC",
    "Paragon",
    "Beta",
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    var border = const OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.black45),
                      border: border,
                      focusedBorder: border),
                ),
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          selectedFilter = filters[index];
                        },
                      );
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filters[index]
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromARGB(255, 221, 221, 221),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 221, 221, 221),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      padding: const EdgeInsets.all(15),
                      label: Text(
                        filters[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(child: LayoutBuilder(builder: (context, constrains) {
            if (constrains.maxWidth > 720) {
              return GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: constrains.maxWidth > 1600 ? 2 : .8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetails(product: products[index]);
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                        productTitle: products[index]['title'].toString(),
                        prodductPrice: products[index]['price'].toString(),
                        productImage: products[index]['imageUrl'].toString()),
                  );
                },
              );
            } else {
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetails(product: products[index]);
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                        productTitle: products[index]['title'].toString(),
                        prodductPrice: products[index]['price'].toString(),
                        productImage: products[index]['imageUrl'].toString()),
                  );
                },
              );
            }
          }))
        ],
      ),
    );
  }
}
