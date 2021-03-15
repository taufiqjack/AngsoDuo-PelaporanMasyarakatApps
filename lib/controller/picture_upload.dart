import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

File img;
String filename;
Future<String> uploadPhoto() async {
  final Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child(filename);
  final UploadTask task = firebaseStorageRef.putFile(img);
}
