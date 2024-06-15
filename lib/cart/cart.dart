import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../list_provider.dart';
import '../product/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartContentProvider>(
        builder: (context, value, child) {
          List<ProductModel> products = value.cartItems;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: products[index].image != null
                    ? CachedNetworkImage(
                        imageUrl: products[index].image!,
                        placeholder: (context, url) => const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey,
                      ),
                title: Text(products[index].name ?? 'No name'),
                subtitle: Text(products[index].price != null
                    ? '\$${products[index].price!.toStringAsFixed(2)}'
                    : 'No price'),
                trailing: IconButton(
                  onPressed: () {
                    value.removeFromCart(products[index]);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}