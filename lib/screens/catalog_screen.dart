// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_screen.dart';
import 'catalog_product.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child: Column(
        children: [
          CatalogProducts(),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:36),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => CartScreen());
                },
                child: Text('Go to Cart', style: TextStyle(fontSize: 16),),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
