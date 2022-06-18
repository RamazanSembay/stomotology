import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stomotology/screens/admin/admin_page.dart';
import 'package:stomotology/screens/admin/admin_upload_page.dart';
import 'package:stomotology/screens/admin/admin_delete_page.dart';
import 'package:stomotology/screens/admin/responsive/config/size_config.dart';
import 'package:stomotology/screens/admin/responsive/dashboard.dart';
import 'package:stomotology/screens/admin/responsive/style/colors.dart';
import 'package:stomotology/screens/login_page.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(color: AppColors.secondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //

              // Mac Navigation
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 20,
                  child: SvgPicture.asset('assets/svg/mac-action.svg'),
                ),
              ),

              // Home
              IconButton(
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  color: AppColors.iconGray,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              // Admin
              IconButton(
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                icon: SvgPicture.asset(
                  'assets/svg/pie-chart.svg',
                  color: AppColors.iconGray,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminPage()),
                  );
                },
              ),

              // Add
              IconButton(
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                icon: Image.asset(
                  'assets/svg/add.png',
                  color: AppColors.iconGray,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminUploadPage()),
                  );
                },
              ),

              // Delete
              IconButton(
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                icon: Image.asset(
                  'assets/svg/delete.png',
                  color: AppColors.iconGray,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminDeletePage()),
                  );
                },
              ),

              // IconButton(
              //     iconSize: 20,
              //     padding: EdgeInsets.symmetric(vertical: 20.0),
              //     icon: SvgPicture.asset(
              //       'assets/svg/trophy.svg',
              //       color: AppColors.iconGray,
              //     ),
              //     onPressed: () {}),
              // IconButton(
              //     iconSize: 20,
              //     padding: EdgeInsets.symmetric(vertical: 20.0),
              //     icon: SvgPicture.asset(
              //       'assets/svg/invoice.svg',
              //       color: AppColors.iconGray,
              //     ),
              //     onPressed: () {}),
              IconButton(
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                icon: Image.asset(
                  'assets/svg/exit.png',
                  color: AppColors.iconGray,
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
