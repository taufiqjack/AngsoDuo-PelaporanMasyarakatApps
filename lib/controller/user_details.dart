import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:angsoduo_pelaporanmasyarakat/models/global.dart' as global;

int totalDocument;

Future<int> getOrderID() async {
  var respectsQuery =
      FirebaseFirestore.instance.collection('UserDetails').where("UserID");
  var querySnapshot = await respectsQuery.get();

  totalDocument = querySnapshot.docs.length;
  print('total : $totalDocument');
  return totalDocument;
}

Future<void> detailUser() async {
  await getOrderID();

  String getId = (totalDocument + 1).toString().padLeft(2, 'ID00');
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("User").doc(getId);

  Map<String, dynamic> user = {
    "uid": global.user.uid,
    "nik": global.user.nik,
    "noTelp": global.user.noTelp,
    "name": global.user.name,
    "email": global.user.email
  };

  documentReference.set(user).whenComplete(() {
    print("${global.user} created");
  });
}
