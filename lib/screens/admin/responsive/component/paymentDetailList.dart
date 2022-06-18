import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stomotology/screens/admin/responsive/component/paymentListTile.dart';
import 'package:stomotology/screens/admin/responsive/config/responsive.dart';
import 'package:stomotology/screens/admin/responsive/config/size_config.dart';
import 'package:stomotology/screens/admin/responsive/data.dart';
import 'package:stomotology/screens/admin/responsive/style/colors.dart';
import 'package:stomotology/screens/admin/responsive/style/style.dart';
import 'package:stomotology/services/firebase_services.dart';

class PaymentDetailList extends StatelessWidget {
  FirebaseService _service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: 'Құрал-жабдықтар',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        FutureBuilder<QuerySnapshot>(
          future: _service.equipment.get(),
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
            return Column(
              children: List.generate(
                snapshot.data.size,
                (index) => PaymentListTile(
                  image: snapshot.data.docs[index]['EquipmentImage'],
                  label: snapshot.data.docs[index]['EquipmentName'],
                ),
              ),
            );
          },
        ),

        SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
                text: 'Диагностика', size: 18, fontWeight: FontWeight.w800),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        FutureBuilder<QuerySnapshot>(
          future: _service.diagnostic.get(),
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
            return Column(
              children: List.generate(
                snapshot.data.size,
                (index) => PaymentListTile(
                  image: snapshot.data.docs[index]['DiagnosticImage'],
                  label: snapshot.data.docs[index]['DiagnosticName'],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
