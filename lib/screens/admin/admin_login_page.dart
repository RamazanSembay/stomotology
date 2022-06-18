import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:stomotology/admin_provider/login_auth_provider.dart';
import 'package:provider/provider.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController adminEmail = TextEditingController();
  TextEditingController adminPassword = TextEditingController();

  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    AdminAuthProvider loginAuthProvider =
        Provider.of<AdminAuthProvider>(context);

    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffffff),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey, //key for form
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  Text(
                    "Здесь, чтобы получить",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Приветствуемый администратор !",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                    controller: adminEmail,
                    decoration:
                        InputDecoration(labelText: 'Введите свой логин'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Введите правильный логин';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                    controller: adminPassword,
                    decoration:
                        InputDecoration(labelText: 'Введите свой пароль'),
                    validator: (value) {
                      if (value.isEmpty ||
                          RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return 'Введите правильный пароль';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NeumorphicButton(
                        margin: EdgeInsets.only(top: 12),
                        onPressed: () {
                          // if (formKey.currentState.validate()) {
                          //   final snackBar =
                          //       SnackBar(content: Text('Submitting form '));
                          //   _scaffoldKey.currentState.showSnackBar(snackBar);
                          // }
                          loginAuthProvider.adminPageVaidation(
                            adminEmail: adminEmail,
                            adminPassword: adminPassword,
                            context: context,
                          );
                        },
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(50),
                            ),
                            color: Color(0xff2F3280)),
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  Row(),
                  SizedBox(height: height * 0.01),
                  Row(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
