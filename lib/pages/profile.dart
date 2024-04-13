import 'dart:ui';

import 'package:OneStack/login.dart';
import 'package:OneStack/pages/home2.dart';
import 'package:OneStack/pages/home3.dart';
import 'package:OneStack/verifynow/verifyprofile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import '../intro_pageview.dart';
import '../legal.dart';
import '../pages/events.dart';
import '../widgets/bottomnav.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/widget3.dart';
import '../widgets/widget4.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:qr_flutter/qr_flutter.dart';

class profile extends StatefulWidget {
  profile({
    Key? key,
    required this.username,
    required this.unfo,
    required this.userid,
    required this.information,
    required this.token,
    required this.pics,
  }) : super(key: key);
  final String username;
  final String token;
  var information;
  final int userid;
  final List pics;
  final unfo;

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  var pic_url;
  var sky4;
  var now;
  var leo;
  bool darkmode = true;
  String _scanBarcode = 'Unknown';
  var verifiedx = [];

  

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    //print(barcodeScanRes);

    //here's  functs
    //final _controller = ScrollController();

    void senE(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Invalid "),
          content: Text("Didn't get the qrcode"),
        ),
      );
    }

    //add the http request here

    setState(() {
      _scanBarcode = barcodeScanRes;
      //print(_scanBarcode.toString());
      final id = _scanBarcode.length;
      //print(barcodeScanRes.substring(2, id));
      //this.getScan(_scanBarcode.toString());
    });
    //if (barcodeScanRes != true) return _launchURL(_scanBarcode.toString());

    if (barcodeScanRes.toString() != '-1' &&
        barcodeScanRes.toString().split('|')[0] == "OneStack") {
      //print(barcodeScanRes.length);
      FlutterBeep.beep();
      Navigator.pop(
        context,
      );
      //htp post herepost
      //getScan(barcodeScanRes.toString());
      //getScan2(barcodeScanRes.toString());
    } else {
      senE(context);
    }
  }

  scanbadge() {
    showDialog(
        //student id card here
        context: context,
        builder: (context) {
          /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
          return AlertDialog(
            backgroundColor: darkmode ? Colors.black : Colors.white,
            title: Center(
                child: Text(
              widget.username.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w200,
                color: darkmode ? Colors.white : Colors.black,
              ),
            )),
            content: Container(
                height: MediaQuery.of(context).size.height * .35,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      child: Stack(children: [
                        Center(
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.deepPurple.withOpacity(0.3),
                            child: Center(
                              child: Text(
                                  widget.username.toString().substring(0, 1)),
                            ),
                          ),
                        ),
                        ...pic_url
                            .where((zz) =>
                                zz['username1'] == widget.username.toString())
                            .map(
                              (ui) =>
                                  ui['username1'] == widget.username.toString()
                                      ? Center(
                                          //bottom:0,
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.transparent,

                                            backgroundImage: NetworkImage(
                                              ui['image'],
                                            ), //ui['image'],
                                          ),
                                        )
                                      : SizedBox(
                                          //ui['image'],
                                          ),
                            ),
                        /*Positioned(
                              right:0,
                              bottom:0,
                              child: Container(
                                                child: Stack(children: [
                                              
                                              ...onlinex.map(
                                                (ui) => ui['username1'] ==
                                                            widget.username.toString() &&
                                                        ui["image"] == "offline"
                                                    ?CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor: darkmode ? Colors.black : Colors.white, //white,
                                                      child: CircleAvatar(
                                                        radius: 5,
                                                        backgroundColor: Colors
                                                            .green,
                                                        child:
                                                            null)) 
                                                    : CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor: darkmode ? Colors.black : Colors.white, //white,
                                                      child: CircleAvatar(
                                                        radius: 5,
                                                        backgroundColor: Colors
                                                            .red,
                                                        child:
                                                            null)),
                                              ),
                                            ])),
                            ),*/
                      ]),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: darkmode ? Colors.white : Colors.white,
                      ),
                      child: QrImageView(
                        // key: "",
                        backgroundColor: Colors.transparent,
                        eyeStyle: QrEyeStyle(color: Colors.black),
                        data: "OneStack|${widget.username}",
                        errorCorrectionLevel: QrErrorCorrectLevel.H,
                        padding: EdgeInsets.all(6.0),
                        gapless: false,
                        dataModuleStyle: QrDataModuleStyle(
                            color: Colors.black,
                            dataModuleShape: QrDataModuleShape.circle),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: Size(40, 40),
                          // color: Colors.deepPurple,
                        ),
                        version: QrVersions.auto,
                        embeddedImage: AssetImage('assets/xon2.png'),

                        size: 180.0,
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(height: 5),
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.cyan.shade600,
                      ),
                      child: Center(
                          child: InkWell(
                        onTap: () {
                          setState(() {
                            now =
                                DateFormat('EEEE d MMM').format(DateTime.now());
                            //returns json body from api
                            //this.courseblock = result1;
                            leo = DateFormat.jm().format(DateTime.now());
                          });

                          scanQR();
                        },
                        child: Text("Scan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkmode
                                  ? Colors.black
                                  : Colors.grey.shade900,
                            )),
                      )),
                    )
                  ]),
                )),
          );
        });
  }

  rono3() {
    showDialog(
        //student id card here
        context: context,
        builder: (context) {
          /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
          return AlertDialog(
            backgroundColor: darkmode ? Colors.black : Colors.white,
            title: ListTile(
              title: Text(
                "Credits",
                style: GoogleFonts.rubik(
                    fontSize: 17,
                    color: darkmode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              subtitle: Text(
                "OneStack v1.0.0 (c)",
                style: GoogleFonts.rubik(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ),
            content: Container(
                // height: MediaQuery.of(context).size.height * .35,
                width: MediaQuery.of(context).size.width * .95,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Row(children: [
                      Text("Special thanks to:",
                          style: GoogleFonts.rubik(
                              fontSize: 17,
                              color: darkmode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.normal)),
                    ]),
                    SizedBox(height: 5),
                    Text("Rono,Rxnaiross,Xonpie99",
                        style: GoogleFonts.rubik(
                            fontSize: 18,
                            color: darkmode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.normal)),
                    Row(children: [
                      Text("and many others.",
                          style: GoogleFonts.rubik(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal)),
                    ]),
                    SizedBox(height: 5),
                  ]),
                )),
          );
        });
  }

  @override
  void initState() {
    //inm();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return true to prevent the user from going back.
        return false;
      },
      child:  Stack(
              children: [
                SizedBox.expand(
                    child: Stack(children: [
                  ...widget.pics
                      .where(
                          (c) => c['username1'] == widget.username.toString())
                      .map(
                        (ui) => Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .4,
                              color: Colors.black,
                              child: ui['image'].split("/").length == 0
                                  ? Image.network(
                                      "https://images.unsplash.com/photo-1594671581654-cc7ed83167bb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3lhbiU1Q3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      ui['image'].replaceAll(" ", ''),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * .8,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.8),
                                        Colors.black.withOpacity(0.8),
                                        Colors.black.withOpacity(1.0)
                                      ],
                                      stops: const [0.1, 0.6, 1],
                                    ),
                                  ),
                                  child: null),
                            ),
                          ],
                        ), //ui['image'],
                      ),
                  widget.pics
                              .where((c) =>
                                  c['username1'] == widget.username.toString())
                              .toList()
                              .length ==
                          0
                      ? Stack(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .8,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.black.withOpacity(0.8),
                                      Colors.black.withOpacity(0.7)
                                    ],
                                    stops: const [0.1, 0.6, 1],
                                  ),
                                ),
                                child: Image.network(
                                  "https://plus.unsplash.com/premium_photo-1668801652170-d4df98071d6a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y3lhbiU1Q3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
                                  fit: BoxFit.cover,
                                )),
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * .8,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.8),
                                        Colors.black.withOpacity(0.8),
                                        Colors.black.withOpacity(1.0)
                                      ],
                                      stops: const [0.1, 0.6, 1],
                                    ),
                                  ),
                                  child: null),
                            ),
                          ],
                        )
                      : SizedBox(),
                ])),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(1.0)
                      ],
                      stops: const [0.1, 0.4, 0.4, 0.4, 0.2, 1],
                    ),
                  ),
                  // color: Colors.white,
                  child: Scaffold(
                    backgroundColor:
                        Colors.transparent, //.black.withOpacity(0.9),
                    body: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.grey.shade500.withOpacity(0.1),
                      child: Home3(
                        pic_url: widget.pics,
                        userid: widget.userid,
                        information: widget.information,
                        unfo: widget.unfo,
                        username: widget.username,
                        token: widget.token,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
