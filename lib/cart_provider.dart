import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cardItems = [];

  void addCart(Map<String, dynamic> cartItem) {
    cardItems.add(cartItem);
    notifyListeners();
  }

  void removeCart(Map<String, dynamic> cartItem) {
    cardItems.remove(cartItem);
    notifyListeners();
  }
}
