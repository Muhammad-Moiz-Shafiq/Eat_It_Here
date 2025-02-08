import 'package:eat_it_here/components/my_receipt.dart';
import 'package:eat_it_here/models/restaurant.dart';
import 'package:eat_it_here/pages/homePage.dart';
import 'package:eat_it_here/services/database/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_bottom_bar.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FirestoreServices db = FirestoreServices();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    final currentUser = auth.currentUser;
    String receipt = context.read<Restaurant>().displayReceipt();
    db.addOrder(receipt, currentUser!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Delivery Progress'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          //on arrow back button pressed
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              context.read<Restaurant>().clearCart();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
        body: Column(
          children: [
            MyReceipt(),
          ],
        ));
  }
}
