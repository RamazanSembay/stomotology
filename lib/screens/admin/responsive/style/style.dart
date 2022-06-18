import 'package:flutter/material.dart';
import 'package:stomotology/screens/admin/responsive/style/colors.dart';

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double height;
  final TextAlign textAlign;

  const PrimaryText({
    this.text,
    this.fontWeight: FontWeight.w400,
    this.color: AppColors.primary,
    this.size: 20,
    this.height: 1.3,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        height: height,
        fontFamily: 'Roboto',
        fontSize: size,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
