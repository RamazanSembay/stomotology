import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/services/admin_firebase_services.dart';
import 'package:stomotology/services/admin_firebase_services_diagnostic.dart';
import 'package:stomotology/services/admin_firebase_services_tool.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xfile/xfile.dart';

class AdminAddDiagnostic extends StatefulWidget {
  @override
  State<AdminAddDiagnostic> createState() => _AdminAddDiagnosticState();
}

class _AdminAddDiagnosticState extends State<AdminAddDiagnostic> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  AdminFirebaseServicesDiagnostic _adminservices = AdminFirebaseServicesDiagnostic();

  TextEditingController _name = TextEditingController();
  TextEditingController _types = TextEditingController();
  TextEditingController _des = TextEditingController();
  TextEditingController _number = TextEditingController();

  String _gender;
  String _type;
  String _imageUrl;
  XFile _image;

  getImage() async {
    final pickedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      this._image = XFile(pickedImage.path);
    } else {
      print('No Image Selected');
    }
    return _image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECECEC),
      body: Form(
        key: _formKey,
        child: Container(
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xff4C4C54),
                                  // color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  'Диагностика',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4C4C54),
                                    // color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    getImage().then((value) {
                      setState(() {
                        value = _image;
                      });
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: _image == null
                        ? NetworkImage(
                            'https://naked-science.ru/wp-content/uploads/2017/11/field_image_0_kritiki_maska3.png')
                        : FileImage(File(_image.path)),
                    radius: 60,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: InkWell(
              //     onTap: () {
              //       getImage().then((value) {
              //         setState(() {
              //           value = _image;
              //         });
              //       });
              //     },

              //     child: CircleAvatar(
              //       backgroundColor: Colors.transparent,
              //       backgroundImage: _image == null
              //           ? NetworkImage(
              //               'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
              //             )
              //           : FileImage(File(_image.path)),
              //       radius: 60,
              //     ),
              //   ),
              // ),

              // Name
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Аты',
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black87,
                      ),
                    ),
                    focusColor: Theme.of(context).primaryColor,
                  ),
                  controller: _name,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Атыңызды жазыңыз';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    value = _name.text;
                  },
                ),
              ),

              // Type
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Сипаттамасы',
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black87,
                      ),
                    ),
                    focusColor: Theme.of(context).primaryColor,
                  ),
                  controller: _types,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Сипаттамасың жазыңыз';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    value = _types.text;
                  },
                ),
              ),

              // Des
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Тип',
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black87,
                      ),
                    ),
                    focusColor: Theme.of(context).primaryColor,
                  ),
                  controller: _des,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Тип түрің жазыңыз';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    value = _des.text;
                  },
                ),
              ),

              // Des
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Number',
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black87,
                      ),
                    ),
                    focusColor: Theme.of(context).primaryColor,
                  ),
                  controller: _number,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter your Type';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    value = _number.text;
                  },
                ),
              ),

              // Button
              FadeInUp(
                delay: Duration(milliseconds: 1000),
                duration: Duration(milliseconds: 1300),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: MaterialButton(
                    onPressed: () {
                      if (_image == null) {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Изображение профиля не выбрано'),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                      if (_formKey.currentState.validate()) {
                        EasyLoading.show(status: 'Загрузка');
                        _adminservices.uploadFile(_image).then((value) {
                          if (value != null) {
                            setState(() {
                              _imageUrl = value;
                            });
                          }
                        }).then((value) {
                          _adminservices.addUserData(data: {
                            'EquipmentImage': _imageUrl,
                            'EquipmentName': _name.text,
                            'DoctorId': _adminservices.user.uid,
                            'DoctorDate': DateTime.now(),
                          });
                        }).then((value) {
                          EasyLoading.dismiss();
                        });
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomeScreen(),
                      //   ),
                      // );
                    },
                    color: Color(0xff4C4C54),
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Қосу',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
