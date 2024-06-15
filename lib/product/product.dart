import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/cart/cart.dart';
import 'package:flutter_provider/list_provider.dart';
import 'package:flutter_provider/product/product_model.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductModel> products = ProductModel.products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
    
      body: Consumer<CartContentProvider>(
        builder: (BuildContext context, CartContentProvider value, Widget? child) {
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
                    if (value.isInCart(products[index])) {
                      value.removeFromCart(products[index]);
                    } else {
                      value.addToCart(products[index]);
                    }
                  },
                  icon: value.isInCart(products[index])
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
