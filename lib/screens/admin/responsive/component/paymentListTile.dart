import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stomotology/screens/admin/responsive/style/colors.dart';
import 'package:stomotology/screens/admin/responsive/style/style.dart';

class PaymentListTile extends StatelessWidget {
  final String image;
  final String label;

  const PaymentListTile({this.image, this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 20),
      visualDensity: VisualDensity.standard,
      leading: Container(
        width: 50,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image(image: NetworkImage(image)),
        // child: SvgPicture.asset(
        //   icon,
        //   width: 20,
        // ),
      ),
      title: PrimaryText(text: label, size: 14, fontWeight: FontWeight.w500),
      // subtitle: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     // PrimaryText(
      //     //   text: '',
      //     //   size: 12,
      //     //   fontWeight: FontWeight.w400,
      //     //   color: AppColors.secondary,
      //     // ),
      //   ],
      // ),
      onTap: () {
        print('tap');
      },
      selected: true,
    );
  }
}
