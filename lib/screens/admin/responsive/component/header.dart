import 'package:flutter/material.dart';
import 'package:stomotology/screens/admin/responsive/style/style.dart';

class Header extends StatelessWidget {
final String title;

  const Header({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                // text: 'Бақылау тақтасы',
                text: title,
                size: 30,
                fontWeight: FontWeight.w800,
              ),
            ]),
      ),
      Spacer(
        flex: 1,
      ),
    ]);
  }
}
