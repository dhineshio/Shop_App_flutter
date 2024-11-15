import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products =
        Provider.of<CartProvider>(context).cardItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(item['imageUrl'].toString()),
              radius: 30,
            ),
            title: Text(
              item['title'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("\$${item['price']}"),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        title: Text(
                          "Delete Product",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        content:
                            Text("Are you sure you want to remove the product"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeCart(item);
                                  Navigator.of(context).pop();
                                });
                              },
                              child: const Text("Yes")),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
