import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDisplayTile extends StatelessWidget {
  final order;
  const OrderDisplayTile({super.key, required this.order});

  void displayOrderDetails(BuildContext context, String dateTime) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            'Order Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Order ID: ${order.id}'),
                Text('Order Date: ${dateTime}\n\n'),
                Text('${order['order']}'),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String dateTime =
        DateFormat('yyyy-MM-dd hh:mm:ss').format(order['date'].toDate());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () => displayOrderDetails(context, dateTime),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID: ${order.id}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16),
              ),
              Text(
                'Order Date: ${dateTime}',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
