import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/provider/send_auth_provider.dart';
import 'package:provider/provider.dart';

class DoctorInformationPage extends StatefulWidget {
  final String DoctorImage;
  final String DoctorName;
  final String DoctorType;
  final String DoctorAddress;
  final String DoctorPhone;

  const DoctorInformationPage({
    Key key,
    this.DoctorImage,
    this.DoctorName,
    this.DoctorType,
    this.DoctorAddress,
    this.DoctorPhone,
  }) : super(key: key);

  @override
  _DoctorInformationPageState createState() => _DoctorInformationPageState();
}

class _DoctorInformationPageState extends State<DoctorInformationPage> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  User user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot vendorData;

  @override
  Widget build(BuildContext context) {
    SendAuthPorvider sendAuthPorvider = Provider.of<SendAuthPorvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    // color: Colors.deepPurple[400],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xff4C4C54),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 220,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        // color: Colors.deepOrange[400],
                                        image: DecorationImage(
                                          image: NetworkImage(widget.DoctorImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              widget.DoctorName,
                                              style: GoogleFonts.roboto(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4C4C54),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              widget.DoctorType,
                                              style: GoogleFonts.roboto(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff21B259),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 350,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Мекен-жайы бойынша қабылдайды: ',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff4C4C54),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.room,
                                      color: Color(0xff21B259),
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Text(
                                          widget.DoctorAddress,
                                          style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff4C4C54),
                                          ),
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
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Divider(
                            color: Color(0xff21B259),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Телефон арқылы жазылу: ',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff4C4C54),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Color(0xff21B259),
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: Text(
                                          widget.DoctorPhone,
                                          style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff4C4C54),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 290,
                    width: double.infinity,
                    color: Color(0xff21B259),
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        Text(
                          'Дәл қазір нөміріңізді қалдырып кетіңіз!',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '5 минут ішінде қайта қоңырау шалып, қажетті ақпаратты\nнақтылаймыз',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40, right: 40, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextFormField(
                              controller: name,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Имя',
                                contentPadding: EdgeInsets.only(left: 10),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff21B259),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextFormField(
                              controller: phone,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // prefixText: '+7',
                                focusColor: Color(0xff21B259),
                                border: InputBorder.none,
                                labelText: 'Номер телефон',
                                contentPadding: EdgeInsets.only(left: 10),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff21B259),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 220,
                          child: RaisedButton(
                            onPressed: () {
                              sendAuthPorvider.sendValidation(
                                context: context,
                                name: name,
                                phone: phone,
                              );
                            },
                            child: Text(
                              'Жіберу',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Color(0xff484848),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
