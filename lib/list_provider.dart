import 'package:flutter/material.dart';
import 'package:flutter_provider/product/product_model.dart';

class NumbersListProvider extends ChangeNotifier{


  List<int> numbers = List.generate(10, (index) {
    return index;
  },);


  void addNumber(){
    numbers.add(numbers.last + 1);
    notifyListeners();
  }
}


class CartContentProvider extends ChangeNotifier{
  List<ProductModel> cartItems = [];
 

  void addToCart(ProductModel item){
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(ProductModel item){
    cartItems.remove(item);
    notifyListeners();
  }

  bool isInCart(ProductModel item){
    return cartItems.contains(item);
  }
}