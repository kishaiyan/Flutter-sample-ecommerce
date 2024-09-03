import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/my_button.dart';
import 'package:shopping_app/model/product.dart';

import '../model/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    void handleDelete(BuildContext context, Product product) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Do you want to delete from the cart"),
                actions: [
                  MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                  MaterialButton(
                    onPressed: () => {
                      Navigator.pop(context),
                      context.read<Shop>().removeItemFromCart(product)
                    },
                    child: Text("Yes"),
                  )
                ],
              ));
    }

    final cart = context.watch<Shop>().userCart;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your cart is empty"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return (ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          onPressed: () => handleDelete(context, item),
                          icon: Icon(Icons.delete),
                        ),
                      ));
                    }),
          ),
          // Pay button to pay for the items in the cart

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyButton(
                child: Text("PAY NOW"),
                color: Theme.of(context).colorScheme.primary,
                onTap: () => handlePay(context)),
          )
        ],
      ),
    );
  }

  void handlePay(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Payment functionality to be added soon"),
            ));
  }
}
