import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/screens/popular_page.dart';
import 'package:stomotology/services/firebase_services.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class PopularAll extends StatelessWidget {
  final String title;

  const PopularAll({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseService _service = FirebaseService();
    return Scaffold(
      body: Container(
        child: Column(
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
                            title,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 550,
                child: FutureBuilder<QuerySnapshot>(
                  future: _service.popular.get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        var data = snapshot.data.docs[index];

                        return PopularSer(
                          PopularImage: data['PopularImage'],
                          PopularName: data['PopularName'],
                          PopularPrice: data['PopularPrice'],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PopularPage(
                                  title: snapshot.data.docs[index]
                                      ['PopularName'],
                                  PopularName: snapshot.data.docs[index]
                                      ['PopularName'],
                                  PopularDes: snapshot.data.docs[index]
                                      ['PopularDes'],
                                  PopularImage: snapshot.data.docs[index]
                                      ['PopularImage'],
                                  PopularPrice: snapshot.data.docs[index]
                                      ['PopularPrice'],
                                  PopularTitle: snapshot.data.docs[index]
                                      ['PopularTitle'],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class PopularSer extends StatelessWidget {
  final String PopularImage;
  final String PopularName;
  final String PopularPrice;
  final Function onTap;

  const PopularSer({
    Key key,
    this.PopularImage,
    this.PopularName,
    this.PopularPrice,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffE4E4DC),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  PopularImage,
                  height: 60.0,
                  width: 60.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      PopularName,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      PopularPrice,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
