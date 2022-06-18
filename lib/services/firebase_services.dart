import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  User user = FirebaseAuth.instance.currentUser;

  CollectionReference diagnostic =
      FirebaseFirestore.instance.collection('Diagnostics');
  CollectionReference equipment =
      FirebaseFirestore.instance.collection('Equipment');
  CollectionReference popular =
      FirebaseFirestore.instance.collection('Popular');
  CollectionReference city = FirebaseFirestore.instance.collection('City');
  CollectionReference almaty = FirebaseFirestore.instance.collection('Almaty');
  CollectionReference astana = FirebaseFirestore.instance.collection('Astana');
  CollectionReference atyrau = FirebaseFirestore.instance.collection('Atyrau');
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  CollectionReference send = FirebaseFirestore.instance.collection('Send');
  CollectionReference doctor = FirebaseFirestore.instance.collection('Doctor');
  CollectionReference category =
      FirebaseFirestore.instance.collection('Category');
}
