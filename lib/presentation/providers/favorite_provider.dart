import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final Set<int> favorites = {};

  void toggle(int id) {
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    notifyListeners();
  }
}