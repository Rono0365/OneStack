import 'dart:ui';

import 'package:OneStack/login.dart';
import 'package:OneStack/store/emoji.dart';
import 'package:OneStack/verifynow/verifyprofile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import '../intro_pageview.dart';
import '../legal.dart';
import '../pages/events.dart';
import '../store/wallet.dart';
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

class editprofile extends StatefulWidget {
  editprofile({
    Key? key,
    required this.username,
    required this.userid,
    required this.token,
    required this.pics,
  }) : super(key: key);
  final String username;
  final String token;
  final int userid;
  final List pics;
  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  var pic_url;
  var sky4;
  var now;
  var leo;
  bool darkmode = true;
  String _scanBarcode = 'Unknown';
  var verifiedx = [];

  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    final info2 = await http.get(Uri.parse('https://afleet.co.ke/information/'),
        headers: headers);

    final verified = await http.get(
      Uri.parse('https://afleet.co.ke/verified/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('verified', json.encode(verified1));

    setState(() {
      verifiedx = verified1;
    });

    //print(verifiedx);
  }

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
                    Text("Rono,Imeje_Alvin,Rxnaiross,Xonpie99",
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

    //print('here' + token);
    ////print(widget.token); wasn't easy but never stopped
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
    inmat();
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
                  pic_url
                              .where((c) =>
                                  c['username1'] == widget.username.toString())
                              .toList()
                              .length ==
                          0
                      ? Stack(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
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
                    extendBody: true,
                    backgroundColor:
                        Colors.transparent, //.black.withOpacity(0.9),
                    body: SingleChildScrollView(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                        ),
                        Container(
                          //height: 100,
                          child: Center(
                              child: ListTile(
                            trailing: InkWell(
                                onTap: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child:
                                      Icon(Ionicons.close, color: Colors.white),
                                )),
                          )),
                        ),
                        Container(
                          height: 10,
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
                          backgroundColor: Colors.cyan.shade100,
                          child: Center(
                            child: Text(widget.username.toString().substring(0, 1),style: GoogleFonts.rubik(fontWeight: FontWeight.bold,color: Colors.cyan.shade600,fontSize: 22),),
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
                                    ...verifiedx.map(
                                      (ui) => ui['username1'] ==
                                                  widget.username.toString() &&
                                              ui["image"] == "Zeus"
                                          ? Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: Icon(Icons.verified,
                                                  size: 16, color: Colors.blue),
                                            )
                                          : SizedBox(),
                                    ),
                                    ...verifiedx.map(
            (ui) => ui['username1'] == widget.username.toString() &&
                    ui["image"] == "Gold"
                ? Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: Icon(Icons.verified, size: 16, color: Color(0xFFffd700),))
                : SizedBox(
                    //ui['image'],
                    ),
          ),
          ...verifiedx.map(
            (ui) => ui['username1'] == widget.username.toString() &&
                    ui["image"] == "green"
                ? Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: Icon(Icons.verified, size: 16, color: Colors.green))
                : SizedBox(
                    //ui['image'],
                    ),
          ),
          ...verifiedx.map(
            (ui) => ui['username1'] == widget.username.toString() &&
                    ui["image"] == "BG"
                ? Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: Icon(Icons.verified, size: 16, color: Colors.blueGrey.shade900))
                : SizedBox(
                    //ui['image'],
                    ),
          ),
                                    ...verifiedx.map((ui) => ui['username1'] ==
                                                widget.username.toString() &&
                                            ui["image"] == "realZeus"
                                        ? Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: Icon(Icons.verified,
                                                size: 16,
                                                color: Colors.cyan.shade600),
                                          )
                                        : SizedBox()),
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
                                          ListTile(
                                            title: Container(
                                              child: verifyprofile(
                                                  username: widget.username,
                                                  token: widget.token),
                                            ),
                                            subtitle: Row(
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
                                                ]),
                                          ),
                                        ]))
                              ]),
                              trailing: Container(
                                  child: InkWell(
                                onTap: () {
                                  scanbadge();
                                },
                                child: Icon(
                                  Ionicons.qr_code,
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
                                onTap: () {
                                  Navigator.push(
                                    //intrpage
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => intrpage(
                                            title: 'addnew',
                                            token: widget.token,
                                            userid: widget.userid
                                                .toString()) //screen(),
                                        ), //MaterialPageRoute
                                  );
                                },
                                child: Icon(Icons.create, color: Colors.grey))),
                        Container(
                          width: MediaQuery.of(context).size.width * 8,
                          padding: EdgeInsets.only(left: 17.0, bottom: 10.0),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
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

                      /*  ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => emojistore(
                                  username:widget.username,
                                  token:widget.token
                                ),
                              ), //MaterialPageRoute
                            );
                            //showPlacePicker();
                          },
                          leading: Icon(Icons.storefront_outlined,
                              color: Colors.brown),
                          title: Text(
                            "Shop for Tips & more ...",
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
                                  builder: (context) => wallet(
                                        username: widget.username,
                                        token: widget.token,
                                        pics: widget.pics,
                                        location: sky4
                                            .where((x) =>
                                                x["username"].toString() ==
                                                widget.username.toString())
                                            .toList()
                                            .reversed
                                            .take(1)
                                            .map(
                                              (e) => e['location'].toString(),
                                              
                                            )
                                            .toString(),
                                      ) //screen(),
                                  ), //MaterialPageRoute
                            );

                            //showPlacePicker();
                          },
                          leading: Icon(Icons.wallet_outlined,
                              color: Colors.blueGrey.shade900),
                          title: Text(
                            "Emo-Wallet",
                            style: GoogleFonts.rubik(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),*/
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
                            Navigator.push(
                              //intrpage
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
                        ListTile(),
                        ListTile(),
                      ],
                    )),
                    bottomNavigationBar: Container(
                      color: Colors.black.withOpacity(0.8),
                      height: 130,
                      child: Center(
                        child: Text(
                          "OneStack v1.0.0",
                          style: GoogleFonts.inconsolata(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
