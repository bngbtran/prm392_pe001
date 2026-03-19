import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, int> items = {};

  void add(int id) {
    items.update(id, (v) => v + 1, ifAbsent: () => 1);
    notifyListeners();
  }

  void increase(int id) {
    items[id] = items[id]! + 1;
    notifyListeners();
  }

  void decrease(int id) {
    if (items[id]! > 1) {
      items[id] = items[id]! - 1;
    } else {
      items.remove(id);
    }
    notifyListeners();
  }
}