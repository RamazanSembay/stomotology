import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomotology/screens/admin/admin_login_page.dart';
import 'package:stomotology/screens/admin/admin_page.dart';
import 'package:stomotology/screens/admin/responsive/dashboard.dart';

class AdminAuthProvider with ChangeNotifier {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(AdminAuthProvider.pattern.toString());

  UserCredential userCredential;

  void adminPageVaidation({
    TextEditingController adminEmail,
    TextEditingController adminPassword,
    BuildContext context,
  }) async {
    if (adminEmail.text.trim().isEmpty) {
      Get.snackbar(
        'Поштаны толтырыңыз',
        'Сіз бос электрондық поштаны енгізбедіңіз',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else if (adminPassword.text.trim().isEmpty) {
      Get.snackbar(
        'Құпия сөзді толтырыңыз',
        'Сіз парольді енгізбедіңіз!',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else {
      try {
        notifyListeners();
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: adminEmail.text,
          password: adminPassword.text,
        )
            .then(
          (value) async {
            notifyListeners();
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
            );
          },
        );
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        notifyListeners();
        print('No');
      }
    }
  }
}
