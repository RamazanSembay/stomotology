import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomotology/widgets/bottom_navigation_tooth.dart';

class SendAuthPorvider with ChangeNotifier {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(SendAuthPorvider.pattern.toString());
  UserCredential userCredential;

  void sendValidation({
    TextEditingController name,
    TextEditingController phone,
    BuildContext context,
  }) async {
    if (name.text.trim().isEmpty) {
      Get.snackbar(
        'Атын толтырыңыз',
        'Сіз өз атыңызды енгізбедіңіз!',
        snackPosition: SnackPosition.TOP,
      );
      return;
    } else {
      if (phone.text.length <= 10) {
        Get.snackbar(
          'Телефон нөмірін толтырыңыз',
          'Телефон нөмірі 11 болуы керек!',
          snackPosition: SnackPosition.TOP,
        );
        return;
      } else {
        try {
          notifyListeners();

          FirebaseFirestore.instance
              .collection("Send")
              .doc(FirebaseAuth.instance.currentUser.uid)
              .set(
            {
              "FullName": name.text,
              "Phone": phone.text,
              "Id": FirebaseAuth.instance.currentUser.uid,
            },
          ).then((value) {
            notifyListeners();
          });
          Get.snackbar(
            'Жіберу',
            'Жәберілді',
            snackPosition: SnackPosition.TOP,
          );
        } on FirebaseAuthException catch (e) {
          print('No');
        }
      }
    }
  }
}
