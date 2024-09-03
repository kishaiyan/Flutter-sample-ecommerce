import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';

import '../model/shop.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you want to add ${product}  to cart"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () => {
                    Navigator.pop(context),
                    context.read<Shop>().addItemToCart(product)
                  },
                  child: Text("Yes"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //product image
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12)),
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Image.asset(product.imagePath)),
                ),
                const SizedBox(height: 25),
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),

                //product description
                Text(
                  product.description,
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.grey[600]),
                ),
                //price
                const SizedBox(height: 25),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$" + product.price.toStringAsFixed(2)),
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                        onPressed: () => addToCart(context),
                        icon: Icon(Icons.add)))
              ],
            )

            //button
          ],
        ));
  }
}
