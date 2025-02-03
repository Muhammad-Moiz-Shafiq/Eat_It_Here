import 'package:flutter/material.dart';

import '../pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget title;
  final Widget child;
  const MySliverAppBar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Text(
        'E A T I T H E R E!',
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      expandedHeight: 320.0,
      collapsedHeight: 100,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: title,
        background: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: child,
        ),
        titlePadding: const EdgeInsets.only(top: 0, left: 0, right: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
