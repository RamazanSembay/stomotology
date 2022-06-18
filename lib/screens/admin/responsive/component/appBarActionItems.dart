import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/svg/calendar.svg',
            width: 20,
          ),
          onPressed: () {},
        ),
        SizedBox(width: 10),
        IconButton(
          icon: SvgPicture.asset('assets/svg/ring.svg', width: 20.0),
          onPressed: () {},
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
