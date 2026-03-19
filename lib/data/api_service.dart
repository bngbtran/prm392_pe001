import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ApiService {
  Future<List<ProductModel>> getProducts() async {
    final res = await http.get(Uri.parse('https://dummyjson.com/products'));
    final data = jsonDecode(res.body);

    return (data['products'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}