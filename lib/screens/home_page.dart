import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/provider/send_auth_provider.dart';
import 'package:stomotology/screens/doctor_information_page.dart';
import 'package:stomotology/screens/equipment_page.dart';
import 'package:stomotology/screens/news_page.dart';
import 'package:stomotology/screens/popular_all.dart';
import 'package:stomotology/screens/popular_page.dart';
import 'package:stomotology/screens/professional.dart';
import 'package:stomotology/screens/services_page.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;
  final url;

  const HomePage({Key key, this.title, this.url}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  User user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot vendorData;

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

  YoutubePlayerController _controller;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
      flags: YoutubePlayerFlags(
          enableCaption: false, isLive: false, autoPlay: false),
    );
  }

  @override
  void initState() {
    getVendorData();
    runYoutubePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    SendAuthPorvider sendAuthPorvider = Provider.of<SendAuthPorvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Қайырлы күн 👋',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff343C44),
                    ),
                  ),
                  Text(
                    vendorData != null
                        ? vendorData.data()['FullName']
                        : 'Загрузка',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff343C44),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Category')
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (!streamSnapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      itemCount: streamSnapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return CategoryList(
                          image: streamSnapshot.data.docs[index]
                              ['CategoryImage'],
                          onTap: () {},
                        );
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Professional(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.people_alt,
                                  color: Color(0xff21B259),
                                  size: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Кәсіби',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.black,
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
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ServicePage(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.miscellaneous_services,
                                  color: Color(0xff21B259),
                                  size: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Қызметтер',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.black,
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
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EquipmentPage(
                                    title: 'Құрал-жабдықтар',
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.construction,
                                  color: Color(0xff21B259),
                                  size: 30,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Құрал-жабдықтар',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: Container(
                      //     margin: EdgeInsets.only(right: 8),
                      //     padding: EdgeInsets.only(left: 16),
                      //     height: 64,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(12),
                      //       border: Border.all(color: Colors.white, width: 1),
                      //     ),
                      //     child: InkWell(
                      //       onTap: () {
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) => NewsPage(
                      //               title: 'Жаңалықтар мен акциялар',
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //       child: Row(
                      //         children: [
                      //           Icon(
                      //             Icons.grid_view,
                      //             color: Color(0xff21B259),
                      //             size: 30,
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.only(left: 16),
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Container(
                      //                   height: 40,
                      //                   width: 150,
                      //                   // color: Colors.red,
                      //                   child: Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.center,
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       Expanded(
                      //                         child: Text(
                      //                           'Жаңалықтар мен акциялар',
                      //                           style: TextStyle(
                      //                             fontWeight: FontWeight.w500,
                      //                             fontSize: 16,
                      //                             color: Colors.black,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Рахат Стоматологиясы',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff21B259),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Біздің мамандар',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Container(
                height: 250,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Doctor')
                        .snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (!streamSnapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshot.data.docs.length,
                        itemBuilder: (contetx, index) {
                          return Doctor(
                            DoctorImage: streamSnapshot.data.docs[index]
                                ['DoctorImage'],
                            DoctorName: streamSnapshot.data.docs[index]
                                ['DoctorName'],
                            DoctorType: streamSnapshot.data.docs[index]
                                ['DoctorType'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorInformationPage(
                                    DoctorImage: streamSnapshot.data.docs[index]
                                        ['DoctorImage'],
                                    DoctorName: streamSnapshot.data.docs[index]
                                        ['DoctorName'],
                                    DoctorType: streamSnapshot.data.docs[index]
                                        ['DoctorType'],
                                    DoctorAddress: streamSnapshot
                                        .data.docs[index]['DoctorAddress'],
                                    DoctorPhone: streamSnapshot.data.docs[index]
                                        ['DoctorPhone'],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Танымал қызметтер',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PopularAll(
                            title: 'Танымал қызметтер',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Барлығы',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Color(0xff21B259),
                  ),
                ],
              ),
            ),
            Container(
              height: 320,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Popular')
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (!streamSnapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: streamSnapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          height: 290,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x04000000),
                                blurRadius: 10,
                                spreadRadius: 10,
                                offset: Offset(0.0, 0.8),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 30,
                                left: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          streamSnapshot.data.docs[index]
                                              ['PopularName'],
                                          style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff21B259),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          streamSnapshot.data.docs[index]
                                              ['PopularPrice'],
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 180,
                                      width: 180,
                                      // color: Colors.red,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            streamSnapshot.data.docs[index]
                                                ['PopularDes'],
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PopularPage(
                                                    title: streamSnapshot
                                                            .data.docs[index]
                                                        ['PopularName'],
                                                    PopularName: streamSnapshot
                                                            .data.docs[index]
                                                        ['PopularName'],
                                                    PopularDes: streamSnapshot
                                                            .data.docs[index]
                                                        ['PopularDes'],
                                                    PopularImage: streamSnapshot
                                                            .data.docs[index]
                                                        ['PopularImage'],
                                                    PopularPrice: streamSnapshot
                                                            .data.docs[index]
                                                        ['PopularPrice'],
                                                    PopularTitle: streamSnapshot
                                                            .data.docs[index]
                                                        ['PopularTitle'],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 150,
                                              // color: Colors.red,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Толығырақ',
                                                    style: TextStyle(
                                                      color: Color(0xff21B259),
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    Icons.navigate_next,
                                                    size: 20,
                                                    color: Color(0xff21B259),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 40,
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
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '"Рахат" цифровой заман',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              height: 370,
              width: double.infinity,
              // color: Colors.black12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Image(
                          image: NetworkImage(
                            'https://www.rstom.kz/wp-content/themes/rahat/img/ic-2.png',
                          ),
                          width: 60,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Қазақстанның үздік клиникасы',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        SvgPicture.network(
                          'https://www.rstom.kz/wp-content/themes/rahat/img/ic-3.svg',
                          width: 60,
                          color: Color(0xff21B259),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Қазақстанның үздік клиникасы',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        SvgPicture.network(
                          'https://www.rstom.kz/wp-content/themes/rahat/img/ic-1.svg',
                          width: 60,
                          color: Color(0xff21B259),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Text(
                            '1 200 000 Кариесов 28 жыл жұмыс істегенде емделді',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        SvgPicture.network(
                          'https://www.rstom.kz/wp-content/themes/rahat/img/ic-5.svg',
                          width: 60,
                          color: Color(0xff21B259),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Text(
                            '15 000 Орнатылған импланттар',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 40,
                // color: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Қысқа шолу бейне',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff21B259),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
              ),
              builder: (context, player) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    player,
                  ],
                );
              },
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;

  const OperationCard({
    Key key,
    this.operation,
    this.selectedIcon,
    this.unselectedIcon,
    this.isSelected,
  }) : super(key: key);

  @override
  State<OperationCard> createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(8.0, 8.0),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: widget.isSelected ? Colors.deepPurple[300] : Colors.deepPurple,
      ),
      child: Column(
        children: [
          Icon(widget.isSelected ? widget.isSelected : widget.unselectedIcon),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: widget.isSelected ? Colors.white : Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final String image;
  final Function onTap;

  const CategoryList({Key key, this.image, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 350,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white),
      ),
    );
  }
}

class Doctor extends StatelessWidget {
  final String DoctorImage;
  final String DoctorName;
  final String DoctorType;
  final Function onTap;

  const Doctor({
    Key key,
    this.DoctorImage,
    this.DoctorName,
    this.DoctorType,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xff21B259)),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Image.network(
                DoctorImage,
                height: 130,
                width: 120,
                fit: BoxFit.cover,
              ),
              Text(
                DoctorName,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7D7D7D),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                DoctorType,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff21B259),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
