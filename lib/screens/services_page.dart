import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/constants.dart';
import 'package:stomotology/screens/diagnostic_page.dart';
import 'package:stomotology/services/firebase_services.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ServicePage extends StatefulWidget {
  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  FirebaseService _service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
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
                                'Қызметтер',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 700,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _service.diagnostic.snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          return ListView.builder(
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            // padding: EdgeInsets.only(left: 16, right: 16),
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              return Best(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DiagnosticPage(
                                        title: snapshot.data.docs[index]
                                            ['DiagnosticName'],
                                        id: snapshot.data.docs[index].id,
                                        collection: snapshot.data.docs[index]
                                            ['DiagnosticName'],
                                        // DiagnosticPrice: snapshot.data
                                        //     .docs[index]['DiagnosticPrice'],
                                        // DiagnosticImage: snapshot.data
                                        //     .docs[index]['DiagnosticImage'],
                                      ),
                                    ),
                                  );
                                },
                                DiagnosticName: snapshot.data.docs[index]
                                    ['DiagnosticName'],
                                DiagnosticType: snapshot.data.docs[index]
                                    ['DiagnosticType'],
                                DiagnosticDescription: snapshot.data.docs[index]
                                    ['DiagnosticDescription'],
                                DiagnosticRate: snapshot.data.docs[index]
                                    ['DiagnosticRate'],
                                DiagnosticImage: snapshot.data.docs[index]
                                    ['DiagnosticImage'],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Best extends StatelessWidget {
  final String DiagnosticName;
  final String DiagnosticType;
  final String DiagnosticDescription;
  final String DiagnosticImage;
  final double DiagnosticRate;
  final Function onTap;

  const Best({
    Key key,
    this.DiagnosticName,
    this.onTap,
    this.DiagnosticType,
    this.DiagnosticDescription,
    this.DiagnosticImage,
    this.DiagnosticRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 245,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 24,
                top: 24,
                right: size.width * .35,
              ),
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA).withOpacity(.45),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    DiagnosticName,
                    style: TextStyle(
                      color: Color(0xff393939),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DiagnosticType,
                    style: TextStyle(color: kLightBlackColor, fontSize: 14),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: BookRating(score: DiagnosticRate),
                        ),
                        Expanded(
                          child: Text(
                            DiagnosticDescription,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: kLightBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.network(
              DiagnosticImage,
              width: size.width * .28,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 40,
              width: size.width * .3,
              child: TwoSideRoundedButton(
                text: "Толығырақ",
                radious: 24,
                press: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TwoSideRoundedButton extends StatelessWidget {
  final String text;
  final double radious;
  final Function press;
  const TwoSideRoundedButton({
    Key key,
    this.text,
    this.radious = 29,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radious),
            bottomRight: Radius.circular(radious),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  final double score;
  const BookRating({
    Key key,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 7),
            blurRadius: 20,
            color: Color(0xFD3D3D3).withOpacity(.5),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.star,
            color: kIconColor,
            size: 15,
          ),
          SizedBox(height: 5),
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
