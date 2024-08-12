import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, Map<String, dynamic>> _items = {};

  Map<String, Map<String, dynamic>> get items => _items;

  double get totalPrice {
    return _items.values.fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  int get totalItems {
    return _items.values.fold(0, (sum, item) => sum + item['quantity'] as int);
  }

  void addItem(Map<String, dynamic> product) {
    if (_items.containsKey(product['name'])) {
      // If the item already exists in the cart, update the quantity
      _items[product['name']]?['quantity'] += product['quantity'];
    } else {
      // Otherwise, add the item to the cart
      _items[product['name']] = product;
    }
    notifyListeners();
  }

  void removeItem(String productName) {
    if (_items.containsKey(productName)) {
      _items.remove(productName);
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
