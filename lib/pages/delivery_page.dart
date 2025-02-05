import 'package:eat_it_here/components/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Delivery Progress'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            MyReceipt(),
          ],
        ));
  }
}
