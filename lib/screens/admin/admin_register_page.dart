import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stomotology/screens/admin/responsive/component/header.dart';
import 'package:stomotology/screens/admin/responsive/config/responsive.dart';
import 'package:stomotology/screens/admin/responsive/config/size_config.dart';
import 'package:stomotology/screens/admin/responsive/dashboard.dart';
import 'package:stomotology/screens/admin/responsive/style/colors.dart';
import 'package:stomotology/screens/admin/responsive/style/style.dart';
import 'package:stomotology/services/firebase_services.dart';

class AdminRegisterPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  FirebaseService _service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: AppColors.black),
              ),
              actions: [
                // AppBarActionItems(),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(
                        title: 'Тіркелгендер',
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      FutureBuilder<QuerySnapshot>(
                        future: _service.users.get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
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
                                    color: Colors.white,
                                  ),
                                  children: [
                                    Container(
                                      height: 90,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              PrimaryText(
                                                text: snapshot.data.docs[index]
                                                    ['FullName'],
                                                size: 20,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary,
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(width: 10),
                                              PrimaryText(
                                                text: snapshot.data.docs[index]
                                                    ['Phone'],
                                                size: 20,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.primary,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              PrimaryText(
                                                text: snapshot.data.docs[index]
                                                    ['Email'],
                                                size: 20,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.primary,
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
