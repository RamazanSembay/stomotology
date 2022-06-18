import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stomotology/screens/admin/admin_reception_page.dart';
import 'package:stomotology/screens/admin/admin_register_page.dart';
import 'package:stomotology/screens/admin/responsive/component/appBarActionItems.dart';
import 'package:stomotology/screens/admin/responsive/component/header.dart';
import 'package:stomotology/screens/admin/responsive/component/historyTable.dart';
import 'package:stomotology/screens/admin/responsive/component/infoCard.dart';
import 'package:stomotology/screens/admin/responsive/component/paymentDetailList.dart';
import 'package:stomotology/screens/admin/responsive/component/side_menu.dart';
import 'package:stomotology/screens/admin/responsive/config/responsive.dart';
import 'package:stomotology/screens/admin/responsive/config/size_config.dart';
import 'package:stomotology/screens/admin/responsive/style/colors.dart';
import 'package:stomotology/screens/admin/responsive/style/style.dart';
import 'package:stomotology/services/firebase_services.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  FirebaseService _service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 100, child: SideMenu()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState.openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.black)),
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
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(
                          title: 'Бақылау тақтасы',
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 4,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminRegisterPage(),
                                    ),
                                  );
                                },
                                child: InfoCardUsers(
                                  icon: 'assets/svg/registered.svg',
                                  label: 'Тіркелгендер',
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AdminReceptionPage(),
                                    ),
                                  );
                                },
                                child: InfoCardSend(
                                  icon: 'assets/svg/doctor.svg',
                                  label: 'Дәрігерге жазылғандар',
                                ),
                              ),
                              // InfoCardDoctor(
                              //   icon: 'assets/svg/doctor.svg',
                              //   label: 'Дәрігер саны',
                              // ),
                              // InfoCardCategory(
                              //   icon: 'assets/svg/category.svg',
                              //   label: 'Категория',
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                                text: 'Ақпарат',
                                size: 30,
                                fontWeight: FontWeight.w800),
                            PrimaryText(
                              text: 'Дәрігерлер',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 3,
                        ),
                        FutureBuilder<QuerySnapshot>(
                          future: _service.doctor.get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                            top: 10.0,
                                            bottom: 10.0,
                                            left: 20.0),
                                        child: CircleAvatar(
                                          radius: 17,
                                          backgroundImage: NetworkImage(
                                            snapshot.data.docs[index]
                                                ['DoctorImage'],
                                          ),
                                        ),
                                      ),
                                      PrimaryText(
                                        text: snapshot.data.docs[index]
                                            ['DoctorName'],
                                        size: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondary,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(width: 10),
                                      PrimaryText(
                                        text: snapshot.data.docs[index]
                                            ['DoctorType'],
                                        size: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        if (!Responsive.isDesktop(context)) PaymentDetailList(),
                      ],
                    ),
                  ),
                )),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration: BoxDecoration(color: AppColors.secondaryBg),
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          AppBarActionItems(),
                          PaymentDetailList(),
                        ],
                      ),
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

class InfoCardUsers extends StatelessWidget {
  FirebaseService _service = FirebaseService();

  final String icon;
  final String label;

  InfoCardUsers({Key key, this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _service.users.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // return Text('${snapshot.data.size}');
        return Container(
          constraints: BoxConstraints(
              minWidth: Responsive.isDesktop(context)
                  ? 200
                  : SizeConfig.screenWidth / 2 - 40),
          padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 20,
              right: Responsive.isMobile(context) ? 20 : 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(icon, width: 35),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              PrimaryText(text: label, color: AppColors.secondary, size: 16),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              PrimaryText(
                text: '${snapshot.data.size}',
                size: 18,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        );
      },
    );
  }
}

class InfoCardSend extends StatelessWidget {
  FirebaseService _service = FirebaseService();

  final String icon;
  final String label;

  InfoCardSend({Key key, this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _service.send.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // return Text('${snapshot.data.size}');
        return Container(
          constraints: BoxConstraints(
              minWidth: Responsive.isDesktop(context)
                  ? 200
                  : SizeConfig.screenWidth / 2 - 40),
          padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 20,
              right: Responsive.isMobile(context) ? 20 : 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(icon, width: 35),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                width: 110,
                child: PrimaryText(
                  text: label,
                  color: AppColors.secondary,
                  size: 16,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              PrimaryText(
                text: '${snapshot.data.size}',
                size: 18,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        );
      },
    );
  }
}

class InfoCardDoctor extends StatelessWidget {
  FirebaseService _service = FirebaseService();

  final String icon;
  final String label;

  InfoCardDoctor({Key key, this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _service.doctor.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // return Text('${snapshot.data.size}');
        return Container(
          constraints: BoxConstraints(
              minWidth: Responsive.isDesktop(context)
                  ? 200
                  : SizeConfig.screenWidth / 2 - 40),
          padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 20,
              right: Responsive.isMobile(context) ? 20 : 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(icon, width: 35),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                width: 110,
                child: PrimaryText(
                  text: label,
                  color: AppColors.secondary,
                  size: 16,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              PrimaryText(
                text: '${snapshot.data.size}',
                size: 18,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        );
      },
    );
  }
}

class InfoCardCategory extends StatelessWidget {
  FirebaseService _service = FirebaseService();

  final String icon;
  final String label;

  InfoCardCategory({Key key, this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _service.category.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // return Text('${snapshot.data.size}');
        return Container(
          constraints: BoxConstraints(
              minWidth: Responsive.isDesktop(context)
                  ? 200
                  : SizeConfig.screenWidth / 2 - 40),
          padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 20,
              right: Responsive.isMobile(context) ? 20 : 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(icon, width: 35),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                width: 110,
                child: PrimaryText(
                  text: label,
                  color: AppColors.secondary,
                  size: 16,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              PrimaryText(
                text: '${snapshot.data.size}',
                size: 18,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        );
      },
    );
  }
}

// return ListView.builder(
                              //   scrollDirection: Axis.vertical,
                              //   itemCount: 4,
                              //   // itemCount: snapshot.data.size,
                              //   itemBuilder: (context, index) {
                              //     return SizedBox(
                              //       width: Responsive.isDesktop(context)
                              //           ? double.infinity
                              //           : SizeConfig.screenWidth,
                              //       child: Table(
                              //         defaultVerticalAlignment:
                              //             TableCellVerticalAlignment.middle,
                              //         children: List.generate(
                              //           snapshot.data.size,
                              //           (index) => TableRow(
                              //             decoration: BoxDecoration(
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //             ),
                              //             children: [
                              //               Container(
                              //                 alignment: Alignment.centerLeft,
                              //                 padding: const EdgeInsets.only(
                              //                     top: 10.0,
                              //                     bottom: 10.0,
                              //                     left: 20.0),
                              //                 child: CircleAvatar(
                              //                   radius: 17,
                              //                   backgroundImage: NetworkImage(
                              //                     snapshot.data.docs[index]
                              //                         ['DoctorImage'],
                              //                   ),
                              //                 ),
                              //               ),
                              //               PrimaryText(
                              //                 text: snapshot.data.docs[index]
                              //                     ['DoctorName'],
                              //                 size: 16,
                              //                 fontWeight: FontWeight.w400,
                              //                 color: AppColors.secondary,
                              //                 textAlign: TextAlign.center,
                              //               ),
                              //               const SizedBox(width: 10),
                              //               PrimaryText(
                              //                 text: snapshot.data.docs[index]
                              //                     ['DoctorType'],
                              //                 size: 16,
                              //                 fontWeight: FontWeight.w400,
                              //                 color: AppColors.secondary,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // );