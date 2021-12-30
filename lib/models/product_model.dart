import 'dart:ffi';

class ProductModel {
  final String name;
  final double price;
  final String imgUrl;

  const ProductModel(
      {required this.name, required this.price, required this.imgUrl});

  static const List<ProductModel> products = [
    ProductModel(
        name: 'Apple',
        price: 2.99,
        imgUrl: 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
    ProductModel(
        name: 'Orange',
        price: 2.99,
        imgUrl: 'https://images.unsplash.com/photo-1557800636-894a64c1696f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1965&q=80'),

    ProductModel(
        name: 'Banana',
        price: 2.99,
        imgUrl: 'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=939&q=80'),
  ];
}
