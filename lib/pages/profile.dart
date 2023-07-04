import 'dart:ui';

import 'package:OneStack/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
    required this.userid,
    required this.token,
  }) : super(key: key);
  final String username;
  final String token;
  final int userid;

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
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    print(barcodeScanRes);

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
      print(_scanBarcode.toString());
      final id = _scanBarcode.length;
      print(barcodeScanRes.substring(2, id));
      //this.getScan(_scanBarcode.toString());
    });
    //if (barcodeScanRes != true) return _launchURL(_scanBarcode.toString());

    if (barcodeScanRes.toString() != '-1' &&
        barcodeScanRes.toString().split('|')[0] == "OneStack") {
      print(barcodeScanRes.length);
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
                        ...pic_url.map(
                          (ui) => ui['username1'] == widget.username.toString()
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
                        embeddedImage: AssetImage('assets/ic_launcher.png'),

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

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky4', json.encode(sky4));
    //sharedPreferences.setString('passed', "passed");
  }

  Future getWeather3x() async {
    String token = widget.token.toString();

    print('here' + token);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response picpic1 = await http
        .get(Uri.parse('https://afleet.co.ke/profpic/'), headers: headers);
    //var results = jsonDecode(responsev.body);
    var picpic = jsonDecode(picpic1.body);
    http.Response responsev = //http://172.16.12.17:8000/
        await http.get(Uri.parse('https://afleet.co.ke/unfo/'),
            headers: headers);
    var results = jsonDecode(responsev.body);
    var results2 = jsonDecode(responsev.body);
    setState(() {
      sky4 = results;
      pic_url = picpic;
    });
    inm();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode(sharedPreferences.getString('pic_url')); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky4'));

    setState(() {
      pic_url = passed;
      sky4 = passed2;
    });
    pic_url == null ? getWeather3x() : "";
  }

  @override
  void initState() {
    getValidation();
    getWeather3x();
    inm();
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => event(
                      token: widget.token,
                      userid: widget.userid,
                      username: widget.username,
                    )));
        // Return true to prevent the user from going back.
        return false;
      },
      child: pic_url == null
          ? Container()
          : Stack(
              children: [
                SizedBox.expand(
                    child: Stack(children: [
                  ...pic_url
                      .where(
                          (c) => c['username1'] == widget.username.toString())
                      .map(
                        (ui) => Stack(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .4,
                                color: Colors.black,
                                child: ui['image'].split("/").length ==0?
                                                Image.network(
                                                    "https://images.unsplash.com/photo-1594671581654-cc7ed83167bb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3lhbiU1Q3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
                                                     fit: BoxFit.cover,
                                                  )
                                              :Image.network(
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
                      pic_url
                      .where(
                          (c) => c['username1'] == widget.username.toString()).toList().length == 0?Stack(
                            children: [
                              Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * .4,
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
                                                      )
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
                          ):SizedBox(),
                ])),
                Container(
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
                    body: SingleChildScrollView(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                              //leading:
                              title: Row(children: [
                                Container(
                                  child: Stack(children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.grey,
                                      child: Center(
                                        child: Text(widget.username
                                            .toString()
                                            .substring(0, 1)),
                                      ),
                                    ),
                                    ...pic_url
                                        .where((c) =>
                                            c['username1'] ==
                                            widget.username.toString())
                                        .map(
                                          (ui) => CircleAvatar(
                                            radius: 35,
                                            backgroundColor: Colors.transparent,

                                            backgroundImage: NetworkImage(
                                              ui['image'].replaceAll(" ", ''),
                                            ), //ui['image'],
                                          ),
                                        ),
                                  ]),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Text(
                                                "${widget.username.toString()}",
                                                style: GoogleFonts.rubik(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white))
                                          ]),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "@${widget.username.toString()}${widget.userid.toString()}",
                                                  style: GoogleFonts.rubik(
                                                      //fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey),
                                                ),
                                              ])
                                        ]))
                              ]),
                              trailing: Container(
                                  child: InkWell(
                                onTap: () {
                                  scanbadge();
                                },
                                child: Icon(
                                  Icons.qr_code_2,
                                  color: Colors.grey,
                                ),
                              ))),
                        ),
                        Container(
                          height: 5,
                        ),
                        ListTile(
                            title: Row(
                              children: [
                                Container(
                                    child: Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 20,
                                )),
                                SizedBox(
                                  width: 5,
                                ),
                                ...sky4
                                    .where((x) =>
                                        x["username"].toString() ==
                                        widget.username.toString())
                                    .toList()
                                    .reversed
                                    .take(1)
                                    .map((e) => Text(
                                          e['location'].toString(),
                                          style: GoogleFonts.firaSans(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ))
                              ],
                            ),
                            subtitle: Row(children: [
                              Container(
                                child: Text(
                                  "  I'm interested in:",
                                  style: GoogleFonts.rubik(
                                      //fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                              ),
                            ]),
                            trailing: InkWell(
                                onTap: () {   Navigator.push( //intrpage
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                     intrpage(title: 'addnew',token: widget.token,userid: widget.userid.toString()) //screen(),
                                  ), //MaterialPageRoute
                            );},
                                child: Icon(Icons.create, color: Colors.grey))),
                        Container(
                          padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                          child: Wrap(
                            runSpacing: 2.0,
                            spacing: 8.0,
                            children: [
                              ...sky4
                                  .where((x) =>
                                      x["username"].toString() ==
                                      widget.username.toString())
                                  .toList()
                                  .reversed
                                  .take(1)
                                  .map((e) => Container(
                                          child: Wrap(spacing: 8.0, children: [
                                        ...e['skills']
                                            .replaceAll("[", "")
                                            .replaceAll("]", "")
                                            .split(',')
                                            .map((op) => Chip(
                                                    label: Text(
                                                  op.toString(),
                                                  style: GoogleFonts.rubik(
                                                      //fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black),
                                                ))),
                                      ])))
                            ],
                          ),
                        ),
                        Container(
                          height: 0.5,
                          width: MediaQuery.of(context).size.width * .95,
                          color: Colors.grey,
                        ),

                        /*ListTile(
                    leading: Container(
  width: 40,
  height: 40,
  decoration: BoxDecoration(
     color: Colors.amber,borderRadius: BorderRadius.circular(10.0),
    
  ),
  child: Icon(Icons.saved_search),
)
                  ),*/
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      legal1(darkmode: false) //screen(),
                                  ), //MaterialPageRoute
                            );
                            /*"""Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShoppingListPage(
                                                            title: darkmode,
                                                          ) //screen(),
                                                      ), //MaterialPageRoute
                                                );"""*/
                            //showPlacePicker();
                          },
                          leading: Icon(Icons.policy, color: Colors.cyanAccent),
                          title: Text(
                            "Policy",
                            style: GoogleFonts.rubik(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      legal3(darkmode: false) //screen(),
                                  ), //MaterialPageRoute
                            );
                            /*"""Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShoppingListPage(
                                                            title: darkmode,
                                                          ) //screen(),
                                                      ), //MaterialPageRoute
                                                );"""*/
                            //showPlacePicker();
                          },
                          leading:
                              Icon(Icons.group, color: Colors.cyan.shade600),
                          title: Text(
                            "Community Guidelines",
                            style: GoogleFonts.rubik(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            rono3();
                            /*"""Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShoppingListPage(
                                                            title: darkmode,
                                                          ) //screen(),
                                                      ), //MaterialPageRoute
                                                );"""*/
                            //showPlacePicker();
                          },
                          leading: Icon(Icons.code, color: Colors.green),
                          title: Text(
                            "Credits",
                            style: GoogleFonts.rubik(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      legal2(darkmode: false) //screen(),
                                  ), //MaterialPageRoute
                            );
                            /*"""Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShoppingListPage(
                                                            title: darkmode,
                                                          ) //screen(),
                                                      ), //MaterialPageRoute
                                                );"""*/
                            //showPlacePicker();
                          },
                          leading: Icon(Icons.local_police, color: Colors.grey),
                          title: Text(
                            "Terms & Conditions",
                            style: GoogleFonts.rubik(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push( //intrpage
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyAppL(title: 'logout') //screen(),
                                  ), //MaterialPageRoute
                            );
                            //get out of my app
                            /*"""Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShoppingListPage(
                                                            title: darkmode,
                                                          ) //screen(),
                                                      ), //MaterialPageRoute
                                                );"""*/
                            //showPlacePicker();
                          },
                          leading:
                              Icon(Icons.logout_outlined, color: Colors.red),
                          title: Text(
                            "Sign Out",
                            style: GoogleFonts.rubik(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Center(
                            child: Text(
                              "OneStack v1.0.0",
                              style: GoogleFonts.inconsolata(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        ListTile(),
                        ListTile(),
                      ],
                    )),
                  ),
                ),
              ],
            ),
    );
  }
}
