import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  static List<Map<String, dynamic>> cartItems = [];
  static int totalCartItems = 0;
  static Map<String, dynamic> cartItem = {};


  void appendList(String itemName, int itemPrice, int itemCount, String itemImage) {
    cartItem = {
      "itemName": itemName,
      "itemPrice": itemPrice,
      "itemCount": itemCount,
      "itemImage": itemImage,
    };
    cartItems.add(cartItem);
    notifyListeners();
  }

  int getTotalCartItems() {
    totalCartItems = cartItems.length;
    return totalCartItems;
  }
}
