import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/provider/register_auth_provider.dart';
import 'package:stomotology/screens/login_page.dart';
import 'package:stomotology/screens/profile_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// String FullName;
// String Email;
// String Password;
// String Phone;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController fullName = TextEditingController();
TextEditingController phone = TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    RegisterAuthPorvider registerAuthProvider =
        Provider.of<RegisterAuthPorvider>(context);

    // void validation() async {
    //   final FormState _form = _formKey.currentState;
    //   if (!_form.validate()) {
    //     try {
    //       UserCredential result = await FirebaseAuth.instance
    //           .createUserWithEmailAndPassword(email: Email, password: Password);
    //       FirebaseFirestore.instance
    //           .collection('Users')
    //           .doc(result.user.uid)
    //           .set({
    //         'UserId': result.user.uid,
    //         'FullName': FullName,
    //         'Email': Email,
    //         'Password': Password,
    //         'Phone': Phone,
    //       });
    //       Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(
    //           builder: (ctx) => LoginPage(),
    //         ),
    //       );
    //     } on PlatformException catch (e) {
    //       print(e.message.toString());
    //       _scaffoldKey.currentState.showSnackBar(
    //         SnackBar(
    //           content: Text(e.message),
    //         ),
    //       );
    //     }
    //     print('Yes');
    //   } else {
    //     print('No');
    //   }
    // }

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 250,
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
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Кіру',
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
                                'Тіркелу',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Өз тістеріңіздің құнын біліңіз',
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
                    height: 500,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    // color: Color(0xff21B259),
                    child: Container(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 60),
                              Column(
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
                                        controller: fullName,
                                        // onChanged: (value) {
                                        //   setState(() {
                                        //     FullName = value;
                                        //   });
                                        // },
                                        // validator: (value) {
                                        //   if (value.length < 6) {
                                        //     return 'Имя пользователя слишком короткое';
                                        //   } else if (value == '') {
                                        //     return 'Пожалуйста, заполните Имя пользователя ';
                                        //   }
                                        //   return '';
                                        // },
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Имя',
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
                                        controller: email,
                                        // onChanged: (value) {
                                        //   setState(() {
                                        //     Email = value;
                                        //   });
                                        // },
                                        // validator: (value) {
                                        //   if (value == '') {
                                        //     return 'Please fill Email';
                                        //   } else if (!regExp.hasMatch(value)) {
                                        //     return 'Email is Invalid';
                                        //   }
                                        //   return '';
                                        // },
                                        textInputAction: TextInputAction.next,
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
                                        controller: password,
                                        // onChanged: (value) {
                                        //   setState(() {
                                        //     Password = value;
                                        //   });
                                        // },
                                        // validator: (value) {
                                        //   if (value == '') {
                                        //     return 'Please fill Password';
                                        //   } else if (value.length < 8) {
                                        //     return 'Password is to short';
                                        //   }
                                        //   return '';
                                        // },
                                        obscureText: obserText,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
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
                                        controller: phone,
                                        // onChanged: (value) {
                                        //   setState(() {
                                        //     Phone = value;
                                        //   });
                                        // },
                                        // validator: (value) {
                                        //   if (value == '') {
                                        //     return 'Please fill Phone';
                                        //   } else if (value.length < 11) {
                                        //     return 'Phone must be 11';
                                        //   }
                                        //   return '';
                                        // },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Номер телефон',
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 55,
                                    // color: Colors.red,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          height: 55,
                                          child: RaisedButton(
                                            onPressed: () {
                                              registerAuthProvider
                                                  .registerValidation(
                                                email: email,
                                                password: password,
                                                fullName: fullName,
                                                phone: phone,
                                                context: context,
                                              );
                                            },
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            color: Color(0xff21B259),
                                            child: Text(
                                              'Тіркелу'.toUpperCase(),
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
                                ],
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
      ),
    );
  }
}


// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stomotology/screens/login_page.dart';
// import 'package:stomotology/screens/profile_page.dart';
// import 'package:image_picker/image_picker.dart';

// class RegisterPage extends StatefulWidget {
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// String FullName;
// String Email;
// String Password;
// String Phone;

// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// String p =
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// RegExp regExp = new RegExp(p);
// bool obserText = true;

// class _RegisterPageState extends State<RegisterPage> {
//   File _pickedImage;
//   PickedFile _image;
//   Future<void> getImage() async {
//     _image = await ImagePicker().getImage(source: ImageSource.camera);
//     _pickedImage = File(_image.path);
//   }

//   @override
//   Widget build(BuildContext context) {
//     void validation() async {
//       final FormState _form = _formKey.currentState;
//       if (!_form.validate()) {
//         try {
//           UserCredential result = await FirebaseAuth.instance
//               .createUserWithEmailAndPassword(email: Email, password: Password);
//           FirebaseFirestore.instance
//               .collection('Users')
//               .doc(result.user.uid)
//               .set({
//             'UserId': result.user.uid,
//             'FullName': FullName,
//             'Email': Email,
//             'Password': Password,
//             'Phone': Phone,
//           });
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (ctx) => ProfilePage()),
//           );
//         } on PlatformException catch (e) {
//           print(e.message.toString());
//           _scaffoldKey.currentState.showSnackBar(
//             SnackBar(
//               content: Text(e.message),
//             ),
//           );
//         }
//         print('Yes');
//       } else {
//         print('No');
//       }
//     }

//     return Scaffold(
//       key: _scaffoldKey,
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             physics: BouncingScrollPhysics(),
//             children: [
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 30, left: 10),
//                         child: Container(
//                           height: 50,
//                           width: double.infinity,
//                           // color: Colors.red,
//                           child: Row(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Icon(
//                                   Icons.arrow_back_ios_new,
//                                   size: 25,
//                                   color: Color(0xff4C4C54),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Container(
//                           height: 110,
//                           width: double.infinity,
//                           // color: Colors.grey,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'РЕГИСТРАЦИЯ'.toUpperCase(),
//                                 style: GoogleFonts.montserrat(
//                                   textStyle: TextStyle(
//                                     color: Color(0xffFCBC2C),
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 15),
//                               Text(
//                                 'Требуется информация для создания учетной записи',
//                                 style: GoogleFonts.montserrat(
//                                   textStyle: TextStyle(
//                                     color: Color(0xff4C4C54),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Container(
//                           height: 350,
//                           width: double.infinity,
//                           // color: Colors.grey,
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 5),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffFFF1D2),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: TextFormField(
//                                     onChanged: (value) {
//                                       setState(() {
//                                         FullName = value;
//                                       });
//                                     },
//                                     validator: (value) {
//                                       if (value.length < 6) {
//                                         return 'Имя пользователя слишком короткое';
//                                       } else if (value == '') {
//                                         return 'Пожалуйста, заполните Имя пользователя ';
//                                       }
//                                       return '';
//                                     },
//                                     textInputAction: TextInputAction.next,
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'Имя',
//                                       hintStyle: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 5),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffFFF1D2),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: TextFormField(
//                                     onChanged: (value) {
//                                       setState(() {
//                                         Email = value;
//                                       });
//                                     },
//                                     validator: (value) {
//                                       if (value == '') {
//                                         return 'Please fill Email';
//                                       } else if (!regExp.hasMatch(value)) {
//                                         return 'Email is Invalid';
//                                       }
//                                       return '';
//                                     },
//                                     textInputAction: TextInputAction.next,
//                                     obscureText: false,
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'Почта',
//                                       hintStyle: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 5),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffFFF1D2),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: TextFormField(
//                                     onChanged: (value) {
//                                       setState(() {
//                                         Password = value;
//                                       });
//                                     },
//                                     obscureText: obserText,
//                                     validator: (value) {
//                                       if (value == '') {
//                                         return 'Please fill Password';
//                                       } else if (value.length < 8) {
//                                         return 'Password is to short';
//                                       }
//                                       return '';
//                                     },
//                                     textInputAction: TextInputAction.next,
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'Пароль',
//                                       hintStyle: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 5),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffFFF1D2),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: TextFormField(
//                                     onChanged: (value) {
//                                       setState(() {
//                                         Phone = value;
//                                       });
//                                     },
//                                     validator: (value) {
//                                       if (value == '') {
//                                         return 'Please fill Phone';
//                                       } else if (value.length < 11) {
//                                         return 'Phone must be 11';
//                                       }
//                                       return '';
//                                     },
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'Номер телефон',
//                                       hintStyle: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Column(
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
//                               color: Color(0xffFCBC2C),
//                               child: Text(
//                                 'Зарегистрироваться'.toUpperCase(),
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
//                             height: 20,
//                           ),
//                           Text(
//                             'У вас уже есть учетная запись ?'.toUpperCase(),
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
//                                       builder: (context) => LoginPage(),
//                                     ),
//                                   );
//                                 },
//                                 child: Text(
//                                   'Войти'.toUpperCase(),
//                                   style: GoogleFonts.montserrat(
//                                     textStyle: TextStyle(
//                                       color: Color(0xffFCBC2C),
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
//                                   color: Color(0xffFCBC2C),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 50),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
