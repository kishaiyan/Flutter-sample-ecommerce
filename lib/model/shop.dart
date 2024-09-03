import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> shop = [
    Product(
        name: "product1",
        price: 19.99,
        description: "good product",
        imagePath: "assets/Orange Air Jordan 1 Retro High OG.jpg"),
    Product(
        name: "product2",
        price: 29.99,
        description: "good product",
        imagePath: "assets/Orange Hoodie Front.jpeg"),
    Product(
        name: "product3",
        price: 59.99,
        description: "good product",
        imagePath: "assets/Orange Sunnies Ponytails Fairytales.webp"),
    Product(
        name: "product4",
        price: 99.99,
        description: "good product",
        imagePath: "assets/Orange Watch Jacob and Co.jpg"),
  ];

  final List<Product> userCart = [];

  List<Product> get usercart => userCart;

  void addItemToCart(Product product) {
    userCart.add(product);
    notifyListeners();
  }

  void removeItemFromCart(Product product) {
    userCart.remove(product);
    notifyListeners();
  }
}
