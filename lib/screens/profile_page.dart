import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/models/user_model.dart';
import 'package:stomotology/provider/user_provider.dart';
import 'package:stomotology/screens/login_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

UserProvider userProvider;

class _ProfilePageState extends State<ProfilePage> {
  Widget _buildAccountName() {
    userProvider = Provider.of(context);
    List<UserModel> userModel = userProvider.userModelList;
    userProvider.getUserData();
    return Column(
        children: userModel.map((e) {
      return Text(
        e.FullName,
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xffFCBC2C),
        ),
      );
    }).toList());
  }

  Widget _buildImageName() {
    userProvider = Provider.of(context);
    List<UserModel> userModel = userProvider.userModelList;
    userProvider.getUserData();
    return Column(
        children: userModel.map((e) {
      return Text(
        e.FullName,
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );
    }).toList());
  }

  User user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot vendorData;

  @override
  void initState() {
    getVendorData();
    super.initState();
  }

  Future<DocumentSnapshot> getVendorData() async {
    var result = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get();
    setState(() {
      vendorData = result;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of(context);
    List<UserModel> userModel = userProvider.userModelList;
    userProvider.getUserData();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  // color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/home.svg',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Қайырлы күн 👋 , ',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff040C0C),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                vendorData != null
                                    ? vendorData.data()['FullName']
                                    : 'Загрузка',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff21B259),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  // color: Colors.green,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfIS1PtpmTs6LTrhPJC2R_95y__HvRYX3Fs3EQZ8eksofo6Nr0aRg8t3bBodNXyeHAXjQ&usqp=CAU'),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            vendorData != null
                                ? vendorData.data()['FullName']
                                : 'Загрузка',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff21B259),
                            ),
                          ),
                          Text(
                            vendorData != null
                                ? vendorData.data()['Email']
                                : 'Загрузка',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff21B259),
                            ),
                          ),
                          Text(
                            vendorData != null
                                ? vendorData.data()['Phone']
                                : 'Загрузка',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff21B259),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: RaisedButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: Colors.black,
                              child: Text(
                                'Шығу'.toUpperCase(),
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
