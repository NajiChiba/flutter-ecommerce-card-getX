// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shope_card_getx/models/product_model.dart';

class CartController extends GetxController {
  // dict stores the acart products
  var _products = {}.obs;

  //add product
  void addProduct(ProductModel product) {
    if (_products.containsKey(product)) {
      _products[product]++;
    } else {
      _products[product] = 1;
    }

    Get.snackbar('Product Added',
        "You have added the product ${product.name} to your cart",
        duration: Duration(seconds: 1),
        backgroundColor: Color(0xFFFAFAFA),
        padding: EdgeInsets.all(20),
        barBlur: 20);
  }

  // getter
  get products => _products;

  // remove product
  void removeProduct(ProductModel product) {
    if (_products[product] > 1) {
      _products[product]--;
    } else {
      _products.removeWhere((key, value) => key == product);
    }
    Get.snackbar('Product Added',
        "You have removed the product ${product.name} to your cart",
        duration: Duration(seconds: 1),
        backgroundColor: Color(0xFFFAFAFA),
        padding: EdgeInsets.all(20),
        barBlur: 20);
  }

  get total => _products.entries
      .map((product) => (product.key.price * product.value))
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
