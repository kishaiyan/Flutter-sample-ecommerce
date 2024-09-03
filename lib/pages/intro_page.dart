import 'package:flutter/material.dart';
import 'package:shopping_app/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 20,
            ),
            //title
            Text(
              "Minimal Shop",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //subtitle
            Text(
              "Premimum Quality Products",
              style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 20,
            ),
            //button
            MyButton(
              color: Theme.of(context).colorScheme.secondary,
              onTap: () {
                Navigator.pushNamed(context, '/shop_page');
              },
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
