import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final products = context.watch<ProductProvider>().products;

    double total = 0;

    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: cart.items.entries.map((e) {
                final product =
                products.firstWhere((p) => p.id == e.key);
                total += product.price * e.value;

                return ListTile(
                  title: Text(product.title),
                  subtitle: Text("Qty: ${e.value}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () =>
                            context.read<CartProvider>().decrease(e.key),
                        icon: Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () =>
                            context.read<CartProvider>().increase(e.key),
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Text("Total: \$${total.toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}