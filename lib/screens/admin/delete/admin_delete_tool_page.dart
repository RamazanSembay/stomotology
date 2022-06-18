import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/screens/admin/responsive/config/responsive.dart';
import 'package:stomotology/screens/admin/responsive/config/size_config.dart';
import 'package:stomotology/screens/admin/responsive/style/colors.dart';
import 'package:stomotology/screens/admin/responsive/style/style.dart';
import 'package:stomotology/services/firebase_services.dart';

class AdminDeleteToolPage extends StatefulWidget {
  @override
  State<AdminDeleteToolPage> createState() => _AdminDeleteToolPageState();
}

class _AdminDeleteToolPageState extends State<AdminDeleteToolPage> {
  FirebaseService _service = FirebaseService();

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
                                  'Құрал-жабдықтар',
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
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: FutureBuilder<QuerySnapshot>(
                  future: _service.equipment.get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return SizedBox(
                      width: Responsive.isDesktop(context)
                          ? double.infinity
                          : SizeConfig.screenWidth,
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: List.generate(
                          snapshot.data.size,
                          (index) => TableRow(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0, left: 20.0),
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundImage: NetworkImage(
                                    snapshot.data.docs[index]['EquipmentImage'],
                                  ),
                                ),
                              ),
                              PrimaryText(
                                text: snapshot.data.docs[index]['EquipmentName'],
                                size: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.secondary,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    FirebaseFirestore.instance
                                        .collection('Equipment')
                                        .doc(snapshot.data.docs[index].id)
                                        .delete();
                                  });
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Color(0xff4C4C54),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
