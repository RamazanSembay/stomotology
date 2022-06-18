import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/screens/category_page.dart';
import 'package:stomotology/screens/home_page.dart';
import 'package:stomotology/screens/profile_page.dart';

import '../constants.dart';

class BottomNavigationTooth extends StatefulWidget {
  @override
  State<BottomNavigationTooth> createState() => _BottomNavigationToothState();
}

class _BottomNavigationToothState extends State<BottomNavigationTooth> {
  var bottomTextStyle = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Color(0xff21B259),
  );

  PageController pageController = PageController();
  List<Widget> pages = [
    HomePage(
      url: 'https://www.youtube.com/watch?v=_Lc0z3iu-z8',
    ),
    CategoryPage(),
    ProfilePage(),
  ];

  int _selectedIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedItems) {
    pageController.jumpToPage(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? new Icon(Icons.home)
                : new Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? new Icon(Icons.work)
                : new Icon(Icons.work),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? new Icon(Icons.account_circle)
                : new Icon(Icons.account_circle),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        selectedFontSize: 12,
        showSelectedLabels: true,
        elevation: 0.0,
      ),
    );
  }
}
