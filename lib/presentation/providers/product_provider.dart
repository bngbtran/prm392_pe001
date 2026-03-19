import 'package:flutter/material.dart';
import '../../data/api_service.dart';
import '../../domain/product.dart';

class ProductProvider extends ChangeNotifier {
  final api = ApiService();

  List<Product> products = [];
  bool loading = false;

  Future<void> fetch() async {
    loading = true;
    notifyListeners();

    products = await api.getProducts();

    loading = false;
    notifyListeners();
  }
}