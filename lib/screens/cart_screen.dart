// ignore_for_file: prefer_const_constructors_in_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_card_getx/conrollers/cart_controller.dart';
import 'package:shope_card_getx/models/product_model.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Card Screen")),
      body: Obx(
        () => Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: ListView.builder(
                    itemCount: cartController.products.length,
                    itemBuilder: (BuildContext context, index) =>
                        AddedProductCard(
                          index,
                          cartController,
                          cartController.products.keys.toList()[index],
                          cartController.products.values.toList()[index],
                        )),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Totale(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class AddedProductCard extends StatelessWidget {
  final int index;
  final CartController cartController;
  final ProductModel product;
  final int qte;
  AddedProductCard(this.index, this.cartController, this.product, this.qte);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(product.imgUrl),
            ),
          ),
          Expanded(
            child: Text(
              product.name,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            onPressed: () {
              cartController.removeProduct(product);
            },
            icon: Icon(Icons.remove_circle),
            color: Colors.blueAccent,
          ),
          Text(
            "${qte}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87),
          ),
          IconButton(
            onPressed: () {
              cartController.addProduct(product);
            },
            icon: Icon(Icons.add_circle),
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

class Totale extends StatelessWidget {
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          "Total",
          style: TextStyle(
              color: Colors.black87, fontSize: 28, fontWeight: FontWeight.w800),
        ),
        Text("\$${cartController.total}",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ))
      ],
    );
  }
}
