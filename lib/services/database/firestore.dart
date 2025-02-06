import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection('orders');
  Future<void> addOrder(String receipt, User user) async {
    await _firestore.add({
      'user': user.uid,
      'email': user.email,
      //'name': user.displayName,
      'date': DateTime.now(),
      'order': receipt,
    });
  }
}
