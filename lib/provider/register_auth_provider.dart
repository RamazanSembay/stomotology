import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomotology/screens/login_page.dart';

class RegisterAuthPorvider with ChangeNotifier {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(RegisterAuthPorvider.pattern.toString());
  UserCredential userCredential;

  void registerValidation({
    TextEditingController fullName,
    TextEditingController email,
    TextEditingController password,
    TextEditingController phone,
    BuildContext context,
  }) async {
    if (fullName.text.trim().isEmpty) {
      Get.snackbar(
        'Заполните имя',
        'Вы не ввели свое имя!',
        snackPosition: SnackPosition.TOP,
      );
      return;
    } else {
      if (!regExp.hasMatch(email.text.trim())) {
        Get.snackbar(
          'Заполните почта',
          'Вы не ввели электронной почты!',
          snackPosition: SnackPosition.TOP,
        );
        return;
      } else {
        if (password.text.trim().isEmpty) {
          Get.snackbar(
            'Заполните пароль',
            'Вы не ввели пароль!',
            snackPosition: SnackPosition.TOP,
          );
          return;
        } else {
          if (password.text.length <= 8) {
            Get.snackbar(
              'Текстовой поля ',
              'Пароль должен быть 8!',
              snackPosition: SnackPosition.TOP,
            );
            return;
          } else {
            try {
              notifyListeners();
              userCredential =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email.text,
                password: password.text,
              );
              notifyListeners();
              FirebaseFirestore.instance
                  .collection("Users")
                  .doc(userCredential.user.uid)
                  .set(
                {
                  "Id": userCredential.user.uid,
                  "FullName": fullName.text,
                  "Email": email.text,
                  "Password": password.text,
                  "Phone": phone.text,
                  "Date": DateTime.now(),
                },
              ).then((value) {
                notifyListeners();
                Get.to(LoginPage());
              });
            } on FirebaseAuthException catch (e) {
              notifyListeners();
              if (e.code == "week-password") {
                Get.snackbar(
                  'Просмотр пароля',
                  'Слабый пароль',
                  snackPosition: SnackPosition.TOP,
                );
              } else if (e.code == 'email-already-in-user') {
                Get.snackbar(
                  'Проверка',
                  'Электронная почта, которая уже используется',
                  snackPosition: SnackPosition.TOP,
                );
              }
            }
          }
        }
      }
    }
  }
}
