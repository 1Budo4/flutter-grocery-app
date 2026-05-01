import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Jabuka", "1.69", "lib/images/apple.png", Colors.green],
    ["Kruh", "2.49", "lib/images/bread.png", Colors.brown],
    ["Riba", "9.99", "lib/images/fish.png", Colors.blue],
    ["Sok", "1.49", "lib/images/juice.png", Colors.orange],
  ];

  List _cartItems = [];

  List<dynamic> get shopItems => _shopItems;

  List<dynamic> get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;

    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
