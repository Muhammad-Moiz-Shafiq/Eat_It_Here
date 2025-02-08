import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // current user
  User? get currentUser => _auth.currentUser;

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(
      String email, String password, String displayName) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      // Update display name in Firebase Authentication
      await user?.updateDisplayName(displayName);
      await user?.reload();

      // Store user details in Firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
        "uid": user?.uid,
        "name": displayName,
        "email": email,
        "createdAt": Timestamp.now(),
      });
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //reset password
  Future sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String getUserDisplayName() {
    return _auth.currentUser?.displayName ?? "Guest";
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
