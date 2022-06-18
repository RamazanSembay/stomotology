import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/constants.dart';
import 'package:stomotology/provider/send_auth_provider.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  final String title;
  final String id;
  final String collection;

  const NewsList({
    Key key,
    this.title,
    this.id,
    this.collection,
  }) : super(key: key);
  @override
  _NewsListState createState() => _NewsListState();
}

bool send = false;

TextEditingController name = TextEditingController();
TextEditingController phone = TextEditingController();

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    SendAuthPorvider sendAuthPorvider = Provider.of<SendAuthPorvider>(context);
    print(widget.id);
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
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xff21B259),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  widget.title,
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff21B259),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      children: [
                        Container(
                            height: 600,
                            width: double.infinity,
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('News')
                                  .doc(widget.id)
                                  .collection('Banner')
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                if (!streamSnapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                send = true;

                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: streamSnapshot.data.docs.length,
                                  itemBuilder: (contetx, index) {
                                    var data = streamSnapshot.data.docs[index];
                                    return Banner(
                                      BannerName: data['BannerName'],
                                      BannerData: data['BannerData'],
                                      BannerImage: data['BannerImage'],
                                      BannerPrice: data['BannerPrice'],
                                    );
                                  },
                                );
                              },
                            )),
                        SizedBox(height: 40),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  final String BannerName;
  final String BannerData;
  final String BannerImage;
  final String BannerPrice;

  const Banner({
    Key key,
    this.BannerName,
    this.BannerData,
    this.BannerImage,
    this.BannerPrice,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SendAuthPorvider sendAuthPorvider = Provider.of<SendAuthPorvider>(context);
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 150,
            child: Image(
              image: NetworkImage(BannerImage),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 50,
            // color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      'Жарияланды: ',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      BannerData,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff21B259),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Категории: ',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Жаңалықтар мен акциялар',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff21B259),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(thickness: 1.5),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2022 жылғы 20 желтоқсаннан 15 қаңтарға дейін',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'АКЦИЯ',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Металл жақшалар',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  BannerPrice,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
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
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
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
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
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
    );
  }
}
