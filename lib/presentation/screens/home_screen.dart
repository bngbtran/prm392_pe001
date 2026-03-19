import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/favorite_provider.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("New Arrivals")),
      body: provider.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: provider.products.length,
        itemBuilder: (context, i) {
          final p = provider.products[i];

          return Card(
            child: ListTile(
              leading: Image.network(p.thumbnail, width: 50),
              title: Text(p.title),
              subtitle: Text("\$${p.price}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      context.read<FavoriteProvider>().toggle(p.id);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      context.read<CartProvider>().add(p.id);
                    },
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(product: p),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}