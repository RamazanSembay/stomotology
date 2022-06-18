import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:xfile/xfile.dart';

class AdminFirebaseServicesTool {
  User user = FirebaseAuth.instance.currentUser;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Equipment');

  // upload image to firebase storege
  Future<String> uploadFile(XFile file) async {
    File _file = File(file.path);
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref('users${user.uid}');

    await ref.putFile(_file);
    // get download link of image
    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  Future<void> addUserData({Map<String, dynamic> data}) {
    // Call the user's CollectionReference to add a new user
    return users
        .add(data)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
