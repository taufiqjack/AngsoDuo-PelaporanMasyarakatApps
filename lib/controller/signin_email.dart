import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

int totalDocument;

Future<int> getOrderID() async {
  var respectsQuery =
      FirebaseFirestore.instance.collection('UserDetails').where("UserID");
  var querySnapshot = await respectsQuery.get();

  totalDocument = querySnapshot.docs.length;
  print('total : $totalDocument');
  return totalDocument;
}

Future<String> signUp(String email, String password) async {
  final user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, password: password);

  // String getId = (totalDocument + 1).toString().padLeft(2, 'ID00');

  // FirebaseFirestore.instance
  //     .collection('User')
  //     .doc(getId)
  //     .set({'uid': user.user.uid, 'email': user.user.email});

  return user.user.uid;
}
