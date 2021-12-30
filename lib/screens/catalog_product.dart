// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_card_getx/conrollers/cart_controller.dart';
import 'package:shope_card_getx/models/product_model.dart';

class CatalogProducts extends StatelessWidget {
  const CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView.builder(
          itemCount: ProductModel.products.length,
          itemBuilder: (BuildContext context, index) => ProductCard(index)),
    );
  }
}

class ProductCard extends StatelessWidget {
  final int index;
  ProductCard(this.index);

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final ProductModel myProduct = ProductModel.products[index];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(myProduct.imgUrl),
          ),
          Text(myProduct.name, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),),
          Text(myProduct.price.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black87),),
          IconButton(onPressed: (){
              cartController.addProduct(myProduct);
          }, icon: Icon(Icons.add_circle), color: Colors.blueAccent,),
        ],
      ),
    );
  }
}
