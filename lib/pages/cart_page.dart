import 'package:eat_it_here/components/cart_tile.dart';
import 'package:eat_it_here/models/restaurant.dart';
import 'package:eat_it_here/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: restaurant.cart.isEmpty
                    ? () {}
                    : () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Are you sure you want to clear the cart?',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No',
                                    style: TextStyle(color: Colors.red)),
                              ),
                              TextButton(
                                onPressed: () {
                                  restaurant.clearCart();
                                  Navigator.pop(context);
                                },
                                child: const Text('Yes',
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ],
                          ),
                        );
                      },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      restaurant.cart.isEmpty
                          ? const Expanded(
                              child: Center(
                                child: Text('Cart is empty...'),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: restaurant.cart.length,
                                itemBuilder: (context, index) {
                                  final cartItem = restaurant.cart[index];
                                  return CartTile(cartItem: cartItem);
                                },
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                MyButton(
                    title: 'Checkout',
                    onTap: restaurant.cart.isEmpty
                        ? () {}
                        : () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const PaymentPage();
                            }));
                          }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
