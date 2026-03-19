import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import '../providers/product_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoriteProvider>();
    final products = context.watch<ProductProvider>().products;

    final list =
    products.where((p) => fav.favorites.contains(p.id)).toList();

    if (list.isEmpty) {
      return Scaffold(
        body: Center(child: Text("No favorites")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: ListView(
        children: list.map((p) => ListTile(title: Text(p.title))).toList(),
      ),
    );
  }
}