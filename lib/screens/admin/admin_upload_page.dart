import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/constants.dart';
import 'package:stomotology/screens/admin/add/admin_add_diagnostic.dart';
import 'package:stomotology/screens/admin/add/admin_add_doctor.dart';
import 'package:stomotology/screens/admin/add/admin_add_tool.dart';
import 'package:stomotology/screens/admin/responsive/config/size_config.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class AdminUploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffECECEC),
        body: Container(
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
                                  size: 30,
                                ),
                                Text(
                                  'Қосу',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4C4C54),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      height: SizeConfig.screenWidth * 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Дәрігерлер
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminAddDoctor(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 180,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xff4C4C54),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/svg/doctor_1.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Дәрігерлер',
                                          style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              // Құрад-жабдықтар
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminAddTool(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 180,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xff4C4C54),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/svg/doctor_2.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Құрал-жабдықтар',
                                          style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     // Диагностика
                          //     InkWell(
                          //       onTap: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) => AdminAddDiagnostic(),
                          //           ),
                          //         );
                          //       },
                          //       child: Container(
                          //         height: 180,
                          //         width: 170,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(15),
                          //           color: Color(0xff4C4C54),
                          //         ),
                          //         child: Padding(
                          //           padding: const EdgeInsets.symmetric(
                          //               horizontal: 20, vertical: 20),
                          //           child: Column(
                          //             mainAxisAlignment: MainAxisAlignment.end,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Image.asset(
                          //                 'assets/svg/doctor_3.png',
                          //                 width: 40,
                          //                 height: 40,
                          //               ),
                          //               SizedBox(height: 10),
                          //               Text(
                          //                 'Диагностика',
                          //                 style: GoogleFonts.roboto(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.white,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          width: double.infinity,
          // color: Colors.grey[500],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // color: Colors.red,
                width: 50,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/home.svg',
                      color: Color(0xff4C4C54),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Басты бет',
                      style: GoogleFonts.roboto(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4C4C54),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';

// import 'package:animate_do/animate_do.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stomotology/services/admin_firebase_services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:xfile/xfile.dart';

// class AdminUploadPage extends StatefulWidget {
//   @override
//   State<AdminUploadPage> createState() => _AdminUploadPageState();
// }

// class _AdminUploadPageState extends State<AdminUploadPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final ImagePicker _picker = ImagePicker();

//   AdminFirebaseServices _adminservices = AdminFirebaseServices();

//   TextEditingController _name = TextEditingController();
//   TextEditingController _phone = TextEditingController();
//   TextEditingController _email = TextEditingController();
//   TextEditingController _address = TextEditingController();

//   String _gender;
//   String _type;
//   String _imageUrl;
//   XFile _image;

//   getImage() async {
//     final pickedImage =
//         await ImagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       this._image = XFile(pickedImage.path);
//     } else {
//       print('No Image Selected');
//     }
//     return _image;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Scaffold(
//         body: ListView(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 ClipPath(
//                   clipper: WaveClipperOne(),
//                   child: Container(
//                     height: 120,
//                     color: Colors.black87,
//                     child: Center(
//                       child: Text(
//                         'Регистрация',
//                         style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             letterSpacing: 5,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     getImage().then((value) {
//                       setState(() {
//                         value = _image;
//                       });
//                     });
//                   },
//                   child: CircleAvatar(
//                     backgroundColor: Colors.transparent,
//                     backgroundImage: _image == null
//                         ? NetworkImage(
//                             'https://naked-science.ru/wp-content/uploads/2017/11/field_image_0_kritiki_maska3.png')
//                         : FileImage(File(_image.path)),
//                     radius: 60,
//                   ),
//                 ),

//                 // Name
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.person),
//                       labelText: 'FullName',
//                       contentPadding: EdgeInsets.zero,
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           width: 3,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       focusColor: Theme.of(context).primaryColor,
//                     ),
//                     controller: _name,
//                     keyboardType: TextInputType.text,
//                     validator: (value) {
//                       if (value.isEmpty) {
//                         return 'Enter your Name';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       value = _name.text;
//                     },
//                   ),
//                 ),

//                 // Phone
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       prefixText: '+',
//                       prefixIcon: Icon(Icons.phone),
//                       labelText: 'Phone',
//                       contentPadding: EdgeInsets.zero,
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           width: 3,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       focusColor: Theme.of(context).primaryColor,
//                     ),
//                     controller: _phone,
//                     maxLength: 10,
//                     keyboardType: TextInputType.phone,
//                     validator: (value) {
//                       if (value.isEmpty) {
//                         return 'Enter your Phone';
//                       }
//                       if (value.length < 10) {
//                         return 'Incorrect phone';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {
//                       value = _phone.text;
//                     },
//                   ),
//                 ),

//                 // Address
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.location_city),
//                       labelText: 'Address',
//                       contentPadding: EdgeInsets.zero,
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           width: 3,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       focusColor: Theme.of(context).primaryColor,
//                     ),
//                     controller: _address,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value.isEmpty) {
//                         return 'Enter your Address';
//                       }

//                       return null;
//                     },
//                     onChanged: (value) {
//                       value = _address.text;
//                     },
//                   ),
//                 ),

//                 // Type
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Type: ',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       SizedBox(width: 30),
//                       Expanded(
//                         child: DropdownButtonFormField(
//                           value: _type,
//                           validator: (value) {
//                             if (value == null) {
//                               return 'Select your gender';
//                             }
//                             return null;
//                           },
//                           onChanged: (String value) {
//                             setState(() {
//                               _type = value;
//                             });
//                           },
//                           items: <String>['Терапевт', 'Стомотология']
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Button
//                 FadeInUp(
//                   delay: Duration(milliseconds: 1000),
//                   duration: Duration(milliseconds: 1300),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//                     child: MaterialButton(
//                       onPressed: () {
//                         if (_image == null) {
//                           return ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text('Изображение профиля не выбрано'),
//                               backgroundColor: Colors.blue,
//                             ),
//                           );
//                         }
//                         if (_formKey.currentState.validate()) {
//                           EasyLoading.show(status: 'Загрузка');
//                           _adminservices.uploadFile(_image).then((value) {
//                             if (value != null) {
//                               setState(() {
//                                 _imageUrl = value;
//                               });
//                             }
//                           }).then((value) {
//                             _adminservices.addUserData(data: {
//                               'DoctorImage': _imageUrl,
//                               'DoctorName': _name.text,
//                               'DoctorPhone': _phone.text,
//                               'DoctorAddress': _address.text,
//                               'DoctorType': _type,
//                               'DoctorId': _adminservices.user.uid,
//                               'DoctorDate': DateTime.now(),
//                             });
//                           }).then((value) {
//                             EasyLoading.dismiss();
//                           });
//                         }
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => HomeScreen(),
//                         //   ),
//                         // );
//                       },
//                       color: Colors.black87,
//                       height: 50,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Регистрация',
//                           style: GoogleFonts.roboto(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
