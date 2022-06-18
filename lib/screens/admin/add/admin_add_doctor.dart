import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/services/admin_firebase_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xfile/xfile.dart';

class AdminAddDoctor extends StatefulWidget {
  @override
  State<AdminAddDoctor> createState() => _AdminAddDoctorState();
}

class _AdminAddDoctorState extends State<AdminAddDoctor> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  AdminFirebaseServices _adminservices = AdminFirebaseServices();

  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _address = TextEditingController();

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
                                  'Дәрігерлер',
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

              // Phone
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixText: '+',
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Номер телефон',
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black87,
                      ),
                    ),
                    focusColor: Theme.of(context).primaryColor,
                  ),
                  controller: _phone,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Телефонды енгізіңіз';
                    }
                    if (value.length < 10) {
                      return 'Қате телефон';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    value = _phone.text;
                  },
                ),
              ),

              // Address
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    labelText: 'Адрес',
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black87,
                      ),
                    ),
                    focusColor: Theme.of(context).primaryColor,
                  ),
                  controller: _address,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Мекен-жайыңызды енгізіңіз';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    value = _address.text;
                  },
                ),
              ),

              // Type
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      'Тип: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: _type,
                        validator: (value) {
                          if (value == null) {
                            return 'Тип түрін таңдаңыз';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          setState(() {
                            _type = value;
                          });
                        },
                        items: <String>['Терапевт', 'Стомотология']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
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
                            'DoctorImage': _imageUrl,
                            'DoctorName': _name.text,
                            'DoctorPhone': _phone.text,
                            'DoctorAddress': _address.text,
                            'DoctorType': _type,
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

                  // child: InkWell(
                  //   onTap: () {
                  //     getImageNew();
                  //   },
                  //   child: selectedImage != null
                  //       ? Container(
                  //           margin: EdgeInsets.symmetric(horizontal: 16),
                  //           height: 150,
                  //           width: MediaQuery.of(context).size.width,
                  //           child: Image.file(selectedImage),
                  //           decoration: BoxDecoration(
                  //             // color: Colors.white,
                  //             border: Border.all(
                  //               width: 2,
                  //               color: Color(0xff4C4C54),
                  //             ),
                  //             borderRadius: BorderRadius.circular(15),
                  //           ),
                  //         )
                  //       : Container(
                  //           margin: EdgeInsets.symmetric(horizontal: 16),
                  //           decoration: BoxDecoration(
                  //             color: Color(0xff4C4C54),
                  //             borderRadius: BorderRadius.circular(6),
                  //           ),
                  //           height: 150,
                  //           width: MediaQuery.of(context).size.width,
                  //           child: Icon(
                  //             Icons.add_a_photo,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  // ),