import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/screens/home_page.dart';
import 'package:stomotology/services/firebase_services.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseService _service = FirebaseService();
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 30,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Рахаттағы мансап',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    height: 110,
                    width: double.infinity,
                    // color: Colors.greenAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            T1(
                              svg:
                                  'https://www.rstom.kz/wp-content/themes/rahat/img/vakansii-icon-oficialno.svg',
                              text: 'Ресми жұмысқа орналастыру',
                            ),
                            T1(
                              svg:
                                  'https://www.rstom.kz/wp-content/themes/rahat/img/vakansii-icon-nastavnichestvo.svg',
                              text:
                                  'Тәлімгерлік, Жұмыс берушінің есебінен оқыту',
                            ),
                            T1(
                              svg:
                                  'https://www.rstom.kz/wp-content/themes/rahat/img/vakansii-icon-korporativ.svg',
                              text: 'Корпоративтік іс-шаралар',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 30,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Біздің жұмыс күндеріміз',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 300,
                  width: double.infinity,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/our.png'),
                        height: 300,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 30,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Өз қалаңызды таңдаңыз',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 900,
                    width: double.infinity,
                    // color: Colors.blue,
                    child: Column(
                      children: [
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  TabBar(
                                    unselectedLabelColor: Color(0xff21B259),
                                    indicator: BoxDecoration(
                                      color: Color(0xff21B259),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    tabs: [
                                      Tab(text: 'Алматы'),
                                      Tab(text: 'Нұр-Сұлтан'),
                                      Tab(text: 'Атырау'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                height: 800,
                                child: TabBarView(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Түйіндемеңізді поштаға жіберіңіз \n marketing@rstom.kz немесе телефон арқылы хабарласыңыз \N +7 (707) 900-88-20',
                                            style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          Column(
                                            children: [
                                              Container(
                                                height: 700,
                                                // color: Colors.red,
                                                child: FutureBuilder<
                                                    QuerySnapshot>(
                                                  future: _service.almaty.get(),
                                                  builder:
                                                      (BuildContext context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                    if (snapshot.hasError) {
                                                      return Text(
                                                          'Something went wrong');
                                                    }

                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 40),
                                                        child: Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                      );
                                                    }

                                                    return StaggeredGridView
                                                        .countBuilder(
                                                      crossAxisCount: 2,
                                                      itemCount:
                                                          snapshot.data.size,
                                                      itemBuilder:
                                                          (context, index) {
                                                        var data = snapshot
                                                            .data.docs[index];

                                                        return Test1(
                                                          AlmatyName: data[
                                                              'AlmatyName'],
                                                          AlmatyDes:
                                                              data['AlmatyDes'],
                                                          onPressed: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (newNotification) =>
                                                                      AlertDialog(
                                                                title: Text(data[
                                                                    'AlmatyName']),
                                                                content: Text(
                                                                  data[
                                                                      'AlmatyJob'],
                                                                ),
                                                                actions: [
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              newNotification)
                                                                          .pop(
                                                                              context);
                                                                    },
                                                                    child: Text(
                                                                        'Жабу'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      staggeredTileBuilder:
                                                          (index) =>
                                                              StaggeredTile.fit(
                                                                  1),
                                                      mainAxisSpacing: 15.0,
                                                      crossAxisSpacing: 15.0,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Өз түйіндемеңізді поштаға жіберіңіз \N marketing@rstom.kz немесе телефон арқылы хабарласыңыз \N +7 (707) 900-88-20',
                                            style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          Column(
                                            children: [
                                              Container(
                                                height: 700,
                                                // color: Colors.red,
                                                child: FutureBuilder<
                                                    QuerySnapshot>(
                                                  future: _service.astana.get(),
                                                  builder:
                                                      (BuildContext context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                    if (snapshot.hasError) {
                                                      return Text(
                                                          'Something went wrong');
                                                    }

                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 40),
                                                        child: Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                      );
                                                    }

                                                    return StaggeredGridView
                                                        .countBuilder(
                                                      crossAxisCount: 2,
                                                      itemCount:
                                                          snapshot.data.size,
                                                      itemBuilder:
                                                          (context, index) {
                                                        var data = snapshot
                                                            .data.docs[index];

                                                        return Test1(
                                                          AlmatyName: data[
                                                              'AstanaName'],
                                                          AlmatyDes:
                                                              data['AstanaDes'],
                                                          onPressed: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (newNotification) =>
                                                                      AlertDialog(
                                                                title: Text(data[
                                                                    'AstanaName']),
                                                                content: Text(
                                                                  data[
                                                                      'AstanaJob'],
                                                                ),
                                                                actions: [
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              newNotification)
                                                                          .pop(
                                                                              context);
                                                                    },
                                                                    child: Text(
                                                                        'Жабу'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      staggeredTileBuilder:
                                                          (index) =>
                                                              StaggeredTile.fit(
                                                                  1),
                                                      mainAxisSpacing: 15.0,
                                                      crossAxisSpacing: 15.0,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Өз түйіндемеңізді поштаға жіберіңіз \N rakhat.atyrau@gmail.com немесе телефон арқылы хабарласыңыз \N +7 (701) 780-75-52',
                                            style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 20),
                                          Column(
                                            children: [
                                              Container(
                                                height: 700,
                                                // color: Colors.red,
                                                child: FutureBuilder<
                                                    QuerySnapshot>(
                                                  future: _service.atyrau.get(),
                                                  builder:
                                                      (BuildContext context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                    if (snapshot.hasError) {
                                                      return Text(
                                                          'Нәрсе емес');
                                                    }

                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 40),
                                                        child: Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                      );
                                                    }

                                                    return StaggeredGridView
                                                        .countBuilder(
                                                      crossAxisCount: 2,
                                                      itemCount:
                                                          snapshot.data.size,
                                                      itemBuilder:
                                                          (context, index) {
                                                        var data = snapshot
                                                            .data.docs[index];

                                                        return Test1(
                                                          AlmatyName: data[
                                                              'AtyrauName'],
                                                          AlmatyDes:
                                                              data['AtyrauDes'],
                                                          onPressed: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (newNotification) =>
                                                                      AlertDialog(
                                                                title: Text(data[
                                                                    'AtyrauName']),
                                                                content: Text(
                                                                  data[
                                                                      'AtyrauJob'],
                                                                ),
                                                                actions: [
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              newNotification)
                                                                          .pop(
                                                                              context);
                                                                    },
                                                                    child: Text(
                                                                        'Жабу'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      staggeredTileBuilder:
                                                          (index) =>
                                                              StaggeredTile.fit(
                                                                  1),
                                                      mainAxisSpacing: 15.0,
                                                      crossAxisSpacing: 15.0,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class T1 extends StatelessWidget {
  final String svg;
  final String text;

  const T1({Key key, this.svg, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          // color: Colors.blue,
          child: SvgPicture.network(
            svg,
          ),
        ),
        Container(
          height: 50,
          width: 120,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Test1 extends StatelessWidget {
  final String AlmatyName;
  final String AlmatyDes;
  final Function onPressed;

  const Test1({
    Key key,
    this.AlmatyName,
    this.AlmatyDes,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff21B259),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AlmatyName,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 90,
                    width: 180,
                    // color: Colors.black,
                    child: Text(
                      AlmatyDes,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(height: 10),
                  ViewButton(
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ViewButton extends StatelessWidget {
  final Function onPressed;

  const ViewButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          'Толығырақ',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff21B259),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
      ),
    );
  }
}
