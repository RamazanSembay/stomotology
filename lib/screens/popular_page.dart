import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stomotology/provider/send_auth_provider.dart';
import 'package:provider/provider.dart';

class PopularPage extends StatelessWidget {
  final String title;
  final String PopularName;
  final String PopularDes;
  final String PopularImage;
  final String PopularPrice;
  final String PopularTitle;

  PopularPage({
    Key key,
    this.title,
    this.PopularName,
    this.PopularDes,
    this.PopularImage,
    this.PopularPrice,
    this.PopularTitle,
  }) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SendAuthPorvider sendAuthPorvider = Provider.of<SendAuthPorvider>(context);
    return Scaffold(
      body: Container(
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
                                title,
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
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        // color: Colors.deepOrange,
                        child: Column(
                          children: [
                            Image(
                              image: NetworkImage(PopularImage),
                              fit: BoxFit.cover,
                              width: 130,
                              height: 130,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        // color: Colors.grey[200],
                        child: Column(
                          children: [
                            Text(
                              PopularName,
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff21B259),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              PopularTitle,
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff21B259),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        // color: Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              PopularDes,
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              PopularPrice,
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
                    SizedBox(height: 15),
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
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 20),
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
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10),
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
          ],
        ),
      ),
    );
  }
}

// class PopularList extends StatelessWidget {
//   final String PopularName;
//   final String PopularDes;
//   final String PopularImage;
//   final String PopularPrice;
//   final String PopularTitle;

//   const PopularList({
//     Key key,
//     this.PopularName,
//     this.PopularDes,
//     this.PopularImage,
//     this.PopularPrice,
//     this.PopularTitle,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Container(
//             width: double.infinity,
//             height: 130,
//             // color: Colors.deepOrange,
//             child: Column(
//               children: [
//                 Image(
//                   image: NetworkImage(PopularImage),
//                   fit: BoxFit.cover,
//                   width: 130,
//                   height: 130,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Container(
//             width: double.infinity,
//             height: 70,
//             // color: Colors.grey[200],
//             child: Column(
//               children: [
//                 Text(
//                   PopularName,
//                   style: GoogleFonts.roboto(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff21B259),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   PopularTitle,
//                   style: GoogleFonts.roboto(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff21B259),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//             width: double.infinity,
//             height: 130,
//             // color: Colors.grey[200],
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   PopularDes,
//                   style: GoogleFonts.roboto(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   PopularPrice,
//                   style: GoogleFonts.roboto(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: 15),
//         Container(
//           width: 220,
//           child: RaisedButton(
//             onPressed: () {},
//             child: Text(
//               'Жазылу',
//               style: GoogleFonts.inter(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(50),
//             ),
//             color: Color(0xff21B259),
//           ),
//         ),
//       ],
//     );
//   }
// }
