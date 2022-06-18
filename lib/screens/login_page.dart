import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/screens/admin/admin_login_page.dart';
import 'package:stomotology/screens/home_page.dart';
import 'package:stomotology/screens/profile_page.dart';
import 'package:stomotology/screens/register_page.dart';
import 'dart:math' as math;

import 'package:stomotology/widgets/bottom_navigation_tooth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

String fullName;
String email;
String password;
String phone;
bool isMale = true;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginPageState extends State<LoginPage> {
  void validation() async {
    final FormState _form = _formKey.currentState;

    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(result);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigationTooth(),
        ),
      );
    } on PlatformException catch (error) {
      var message = "Пожалуйста, Проверьте Ваше Подключение К Интернету";
      if (error.message != null) {
        message = error.message;
      }
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message.toString()),
          duration: Duration(milliseconds: 800),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }

    atch(error) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  color: Color(0xff21B259),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 35,
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('assets/images/logosto.png'),
                              height: 60,
                              width: 60,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Тіркелу',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Қош келдіңіз',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Біз әрқашан сіз үшін жақсы болуға тырысамыз',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  // color: Color(0xff2D665F),
                  child: Container(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 60),
                            Container(
                              height: 190,
                              width: double.infinity,
                              // color: Colors.grey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Color(0xff21B259),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                            email = value;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == '') {
                                            return 'Электрондық поштаны толтырыңыз';
                                          } else if (!regExp.hasMatch(value)) {
                                            return 'Электрондық пошта мекенжайы жарамсыз';
                                          }
                                          return '';
                                        },
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Почта',
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Color(0xff21B259),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                            password = value;
                                          });
                                        },
                                        obscureText: obserText,
                                        validator: (value) {
                                          if (value == '') {
                                            return 'Құпия сөзді енгізіңіз';
                                          } else if (value.length < 8) {
                                            return 'Пароль қысқа болуы керек';
                                          }
                                          return '';
                                        },
                                        decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                obserText = !obserText;
                                              });
                                              FocusScope.of(context).unfocus();
                                            },
                                            child: Icon(
                                              obserText == true
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.white,
                                            ),
                                          ),
                                          border: InputBorder.none,
                                          hintText: 'Пароль',
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 55,
                              // color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 55,
                                    child: RaisedButton(
                                      onPressed: () {
                                        validation();
                                      },
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      color: Color(0xff21B259),
                                      child: Text(
                                        'Кіру'.toUpperCase(),
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminLoginPage(),
                                  ),
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Админ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Color(0xff5D9E87),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stomotology/screens/profile_page.dart';
// import 'package:stomotology/screens/register_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// String userName;
// String email;
// String password;
// String phone;
// bool isMale = true;

// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// String p =
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// RegExp regExp = new RegExp(p);
// bool obserText = true;

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     void validation() async {
//       final FormState _form = _formKey.currentState;

//       try {
//         UserCredential result = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email, password: password);
//         print(result);
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProfilePage(),
//           ),
//         );
//       } on PlatformException catch (error) {
//         var message = "Пожалуйста, Проверьте Ваше Подключение К Интернету";
//         if (error.message != null) {
//           message = error.message;
//         }
//         _scaffoldKey.currentState.showSnackBar(
//           SnackBar(
//             content: Text(message.toString()),
//             duration: Duration(milliseconds: 800),
//             backgroundColor: Theme.of(context).primaryColor,
//           ),
//         );
//       }

//       atch(error) {
//         _scaffoldKey.currentState.showSnackBar(SnackBar(
//           content: Text(error.toString()),
//           duration: Duration(milliseconds: 800),
//           backgroundColor: Theme.of(context).primaryColor,
//         ));
//       }
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           physics: BouncingScrollPhysics(),
//           children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(height: 30),
//                     Container(
//                       height: 50,
//                       width: double.infinity,
//                       // color: Colors.red,
//                       child: Row(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Icon(
//                               Icons.arrow_back_ios_new,
//                               size: 25,
//                               color: Color(0xff4C4C54),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Container(
//                       height: 130,
//                       width: double.infinity,
//                       // color: Colors.grey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'ВОЙТИ'.toUpperCase(),
//                             style: GoogleFonts.montserrat(
//                               textStyle: TextStyle(
//                                 color: Color(0xffAE1B2C),
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 15),
//                           Text(
//                             'Выбор входа зависит от способа регистрации',
//                             style: GoogleFonts.montserrat(
//                               textStyle: TextStyle(
//                                 color: Color(0xff4C4C54),
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Container(
//                       height: 200,
//                       width: double.infinity,
//                       // color: Colors.grey,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 5),
//                               decoration: BoxDecoration(
//                                 color: Color(0xffFFD3D8),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: TextFormField(
//                                 onChanged: (value) {
//                                   setState(() {
//                                     email = value;
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (value == '') {
//                                     return 'Пожалуйста, заполните электронную почту';
//                                   } else if (!regExp.hasMatch(value)) {
//                                     return 'Адрес электронной почты недействителен';
//                                   }
//                                   return '';
//                                 },
//                                 obscureText: false,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: 'Почта',
//                                   hintStyle: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 5),
//                               decoration: BoxDecoration(
//                                 color: Color(0xffFFD3D8),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: TextFormField(
//                                 onChanged: (value) {
//                                   setState(() {
//                                     password = value;
//                                   });
//                                 },
//                                 obscureText: obserText,
//                                 validator: (value) {
//                                   if (value == '') {
//                                     return 'Пожалуйста, введите Пароль';
//                                   } else if (value.length < 8) {
//                                     return 'Пароль должен быть коротким';
//                                   }
//                                   return '';
//                                 },
//                                 decoration: InputDecoration(
//                                   suffixIcon: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         obserText = !obserText;
//                                       });
//                                       FocusScope.of(context).unfocus();
//                                     },
//                                     child: Icon(
//                                       obserText == true
//                                           ? Icons.visibility
//                                           : Icons.visibility_off,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   border: InputBorder.none,
//                                   hintText: 'Пароль',
//                                   hintStyle: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Container(
//                       height: 210,
//                       // color: Colors.red,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: double.infinity,
//                             height: 55,
//                             child: RaisedButton(
//                               onPressed: () {
//                                 validation();
//                               },
//                               elevation: 0.0,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               color: Color(0xffAE1B2C),
//                               child: Text(
//                                 'Войти'.toUpperCase(),
//                                 style: GoogleFonts.montserrat(
//                                   textStyle: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           Text(
//                             'У вас нет аккаунт ?'.toUpperCase(),
//                             style: GoogleFonts.montserrat(
//                               textStyle: TextStyle(
//                                 color: Color(0xff4C4C54),
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => RegisterPage(),
//                                     ),
//                                   );
//                                 },
//                                 child: Text(
//                                   'Регистрация'.toUpperCase(),
//                                   style: GoogleFonts.montserrat(
//                                     textStyle: TextStyle(
//                                       color: Color(0xffAE1B2C),
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Transform(
//                                 alignment: Alignment.center,
//                                 transform: Matrix4.rotationY(math.pi),
//                                 child: Icon(
//                                   Icons.arrow_back_ios_new,
//                                   size: 18,
//                                   color: Color(0xffAE1B2C),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
