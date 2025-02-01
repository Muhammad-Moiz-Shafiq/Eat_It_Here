import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});
  @override
  Widget build(BuildContext context) {
    var kPrimaryTextColor =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var kSecondaryTextColor =
        TextStyle(color: Theme.of(context).colorScheme.primary);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //delivery fee
              Text(
                '\$ 0.99',
                style: kPrimaryTextColor,
              ),
              Text(
                'Delivery fee',
                style: kSecondaryTextColor,
              ),
            ],
          ),
          Column(
            children: [
              //delivery time
              Text(
                '20-30 min',
                style: kPrimaryTextColor,
              ),
              Text(
                'Delivery time',
                style: kSecondaryTextColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
