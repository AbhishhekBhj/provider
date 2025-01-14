import 'package:flutter/material.dart';
import 'package:flutter_provider/home.dart';
import 'package:flutter_provider/list_provider.dart';
import 'package:flutter_provider/product/product.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumbersListProvider()),
        ChangeNotifierProvider(create: (context) => CartContentProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductScreen(),
      ),
    );
  }
}