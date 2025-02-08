import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_it_here/components/order_display_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  Future<List<QueryDocumentSnapshot>> fetchOrders() async {
    String? email = FirebaseAuth.instance.currentUser?.email;

    if (email == null) {
      throw Exception("User not logged in");
    }

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('email', isEqualTo: email)
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs; // Returning list of documents
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('O R D E R S'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: FutureBuilder<List<QueryDocumentSnapshot>>(
          future: fetchOrders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No orders found.'));
            }

            var orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                var order = orders[index];
                return OrderDisplayTile(order: order);
              },
            );
          },
        ));
  }
}
