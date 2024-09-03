import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/my_drawer.dart';
import 'package:shopping_app/components/product_tile.dart';

import '../model/shop.dart';

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Good Stuff",
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Text('Select from unique style of products '),
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductTile(product: product);
                }),
          ),
        ],
      ),
    );
  }
}
