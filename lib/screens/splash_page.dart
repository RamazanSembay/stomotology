import 'package:flutter/material.dart';
import 'package:stomotology/screens/welcome_page.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;
  SplashPage({this.duration, this.goToPage});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => this.goToPage,
        ),
      );
    });

    return Scaffold(
      body: Container(
        color: Color(0xff21B259),
        child: Center(
          child: Image(
            height: 150,
            width: 150,
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
