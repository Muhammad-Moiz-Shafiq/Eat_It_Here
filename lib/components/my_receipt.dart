import 'package:eat_it_here/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 35.0, left: 20, right: 20, bottom: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Thank You!'),
            Text('Your order has been placed!'),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) {
                  return Text(restaurant.displayReceipt());
                },
              ),
            ),
            const SizedBox(height: 25),
            const Text('Your order will be delivered in 30-40 minutes!'),
          ],
        ),
      ),
    );
  }
}
