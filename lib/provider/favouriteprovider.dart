import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final Map<String, Map<String, dynamic>> _favorites = {};

  Map<String, Map<String, dynamic>> get favorites => _favorites;

  bool isFavorite(String productName) {
    return _favorites.containsKey(productName);
  }

  void addFavorite(Map<String, dynamic> product) {
    if (!_favorites.containsKey(product['name'])) {
      _favorites[product['name']] = product;
      notifyListeners();
    }
  }

  void removeFavorite(String productName) {
    if (_favorites.containsKey(productName)) {
      _favorites.remove(productName);
      notifyListeners();
    }
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}
