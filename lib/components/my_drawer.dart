import 'package:flutter/material.dart';
import 'package:shopping_app/components/list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //draw header
        Column(
          children: [
            DrawerHeader(
                child: Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            )),

            const SizedBox(
              height: 25,
            ),
            //shop tile
            MyListTile(
              icon: Icon(Icons.home),
              title: Text('SHOP'),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/shop_page');
              },
            ),

            MyListTile(
                icon: Icon(Icons.shopping_basket),
                title: Text('CART'),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '/cart_page');
                }),
          ],
        ),
        //cart tile
        //exit shop
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: MyListTile(
              icon: Icon(Icons.logout),
              title: Text('LOGOUT'),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_page', (route) => false);
              }),
        ),
      ]),
    );
  }
}
