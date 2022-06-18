import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stomotology/screens/admin/responsive/config/responsive.dart';
import 'package:stomotology/screens/admin/responsive/config/size_config.dart';
import 'package:stomotology/screens/admin/responsive/data.dart';
import 'package:stomotology/screens/admin/responsive/style/colors.dart';
import 'package:stomotology/screens/admin/responsive/style/style.dart';
import 'package:stomotology/services/firebase_services.dart';

class HistoryTable extends StatelessWidget {
  FirebaseService _service = FirebaseService();

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
        Container(
          height: 350,
          child: FutureBuilder<QuerySnapshot>(
            future: _service.doctor.get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                              snapshot.data.docs[index]['DoctorImage'],
                            ),
                          ),
                        ),
                        PrimaryText(
                          text: snapshot.data.docs[index]['DoctorName'],
                          size: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondary,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 10),
                        PrimaryText(
                          text: snapshot.data.docs[index]['DoctorType'],
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
        );
      },
    );
  }
}
