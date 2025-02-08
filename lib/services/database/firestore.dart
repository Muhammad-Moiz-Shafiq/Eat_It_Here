import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection('orders');
  Future<void> addOrder(String receipt, User user) async {
    await _firestore.add({
      'user ID': user.uid,
      'email': user.email,
      'username': user.displayName,
      'date': DateTime.now(),
      'order': receipt,
    });
  }

  //getting orders
  Future<List<QueryDocumentSnapshot>> fetchOrders() async {
    String? email = FirebaseAuth.instance.currentUser?.email;

    if (email == null) {
      throw Exception("User is not logged in!");
    }

    QuerySnapshot snapshot = await _firestore
        .where('email', isEqualTo: email)
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs; // Returning list of documents
  }
}
