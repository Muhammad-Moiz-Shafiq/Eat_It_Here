import 'package:flutter/material.dart';

import '../models/food.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food, this.onTap});
  final Food food;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        '\$ ' + food.price.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        food.description,
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    food.imagePath,
                    width: 120,
                    height: 120,
                    // fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          endIndent: 25,
          indent: 25,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ],
    );
  }
}
