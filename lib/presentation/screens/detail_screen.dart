import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/product.dart';
import '../providers/cart_provider.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(product.thumbnail),
          Text(product.title),
          Text("\$${product.price}"),
          Text(product.description),
          ElevatedButton(
            onPressed: () {
              context.read<CartProvider>().add(product.id);
            },
            child: Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}