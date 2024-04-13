// ignore_for_file: unrelated_type_equality_checks

import 'dart:ui';
import 'package:flame_audio/flame_audio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ionicons/ionicons.dart';

import 'legal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
//import 'netcloud.dart';
//import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppL extends StatefulWidget {
  MyAppL({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  _MyAppLState createState() => _MyAppLState();
}

class _MyAppLState extends State<MyAppL> {
  final audioCache = AudioCache();

  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  //final titleController = TextEditingController();
  //final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();
  final titleController4 = TextEditingController();
  final titleControllerv = TextEditingController();

  var passtok;
  var userid;
  var userid1;
  var userid2;
  var userid3;
  final googleSignIn = GoogleSignIn();

  var _name;
  var firstnameg;
  var lastnameg;
  var usernameg;
  var img11;
  var passwordg;
  var _emailg;

  Future _signInWithGoogle() async {
    final googleSignInAccount = await googleSignIn.signIn();
    //final googleSignInAccount = await googleSignIn.signIn();
    final displayName = googleSignInAccount!.displayName;
    final _email = googleSignInAccount.email;
    final img11x = googleSignInAccount.photoUrl;
    final nameSplit = displayName.toString().split(" ");

    setState(() {
      firstnameg = nameSplit.first;
      lastnameg = nameSplit.last;
      usernameg = firstnameg + lastnameg;
      _emailg = _email.toString();
      img11 = img11x.toString();
    });

   
  }

  bool pressd = false;
  int State = 0;
  int State2 = 0;
  var usercorrecion;
  bool obsc = true;
  //var passtok;
  String PassToken = '';
  String ID = '';
  final storage = new FlutterSecureStorage();
  //var userid;
  var value;
  //int State = 0;
  fireOne() {
    audioCache.play('assets/notificationz.mp3');

    //FlameAudio.play('assets/notificationz.mp3');
  }

  Future createpic() async {
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/profpic/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'username1': usernameg,
        'image': img11,
      }),
    );

    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);

   
    if (response1.statusCode == 201) {
     
    }
    ;

    //});
//save the token for next time
  }

  Future create1() async {
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/registerff/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': titleController.text,
        'password': titleController1.text,
        'password2': titleController1.text,
        'email': titleController3.text,
        'first_name': titleController4.text,
        'last_name': titleControllerv.text,
      }),
    );

    //works => print(token['token']);

    var token = jsonDecode(response1.body);

    
    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
      usercorrecion = response1.body;
    });
    //var token = jsonDecode(response1.body);
  }

  Future create2() async {
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/registerff/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': usernameg,
        'password': "xcsdrono2022",
        'password2': "xcsdrono2022",
        'email': _emailg,
        'first_name': firstnameg,
        'last_name': lastnameg,
      }),
    );

    //works => print(token['token']);

    var token = jsonDecode(response1.body);

  
    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
      usercorrecion = response1.body;
    });
    //var token = jsonDecode(response1.body);
  }

  Future logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    sharedPreferences.remove('key');
    //var idk = sharedPreferences.getString('key');

    }

  Future getValidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtoken = sharedPreferences.getString('token');
    var idk = sharedPreferences.getString('key');
    //var idk = sharedPreferences.getString('key');

    setState(() {
      PassToken = obtoken;
      ID = idk;
    });
   
  }

  @override
  void initState() {
    audioCache.load('assets/b_knock.mp3');
    audioCache.load('assets/gulag_buzzer.mp3');
    audioCache.load('assets/notific.mp3');
    audioCache.load('assets/notification.mp3');
    audioCache.load('assets/notificationz.mp3');
    audioCache.load('assets/postsmth.mp3');
    audioCache.load('assets/sendsmth.mp3');

    //initialize();
    widget.title.toString() == ''
        ? getValidation().whenComplete(() {
            PassToken != null
                    ? Future.delayed(Duration.zero, () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyApp(
                                    title: 'OneStack',
                                    token: PassToken,
                                    userid: ID)));
                      })
                    : Container()
                //MyAppL()
                //.whenComplete(() async {

                ;
            //print("here she comes:" + userid);
          })
        : logout();

    super.initState();
  }

  Future login7() async {
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/api-token-auth_forfF/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': firstnameg + lastnameg,
        'password': "xcsdrono2022",
      }),
    );
   
    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
      usercorrecion = response1.body;
    });
    var token = jsonDecode(response1.body);
   
    if (response1.statusCode == 200) {
      setState(() async {
        passtok = token['token'].toString();
        userid = token['user_id'].toString();
        await storage.write(key: userid, value: passtok);
        value = storage.read(key: userid);
      });

      //});
//save the token for next time
    }
  }

  Future createAlbum() async {
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/api-token-auth_forfF/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': titleController.text,
        'password': titleController1.text,
      }),
    );
    //print(response1);
    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
      usercorrecion = response1.body;
    });
    var token = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      setState(() async {
        passtok = token['token'].toString();
        userid = token['user_id'].toString();
        await storage.write(key: userid, value: passtok);
        value = storage.read(key: userid);
      });

      //});
//save the token for next time
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Stack(children: [
      SizedBox.expand(
        child: Image.asset(
          'assets/forthepeople.jpeg',
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(1.0)
              ],
              stops: const [0.1, 0.6, 1],
            ),
          ),
          child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Center(
                  child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: 15,
                  ),
                  //Image.asset('assets/judegroceries-removebg-preview.png'),

                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.10,
                  ),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(3.0),
                    child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.40,
                            ),
                            //https://www.google.com/search?q=illustration+qr+code+drawing&sxsrf=APq-WBvyA863MRv7UgrxoUuglVUDFrRHhQ:1648523831027&tbm=isch&source=iu&ictx=1&vet=1&fir=gkZVKHnUvSESmM%252CYpTeIJ7_t3iUMM%252C_%253BSWMbnmfmxyvzMM%252Cwdng2dY126YtkM%252C_%253BvUcJA6ARjjWbYM%252Cf8Qjb9nHxR1BcM%252C_%253Bo0STY6lj_-dnoM%252C4quweExXGeEGZM%252C_%253Bt_QzcAXML7Gv-M%252CeNcvHA6qMiZqRM%252C_%253BJSiWvVkyQv-pWM%252Cf4gCUS9n_xuspM%252C_%253Bl8BN6QfbWTuFyM%252CilENFJ89gaqY0M%252C_%253BJ9Dg-_9fnUGkNM%252Cp1ssrBPOYBj5IM%252C_%253BZZv9k59aCYIP0M%252C-KAOCPBRIRsm4M%252C_%253BlOMJ-pVYka6Y7M%252Cf4gCUS9n_xuspM%252C_%253BU0Y1zjAnDEpb5M%252CBmlZjyL7xGa4eM%252C_%253B1vHR2KOqJLGBMM%252CU8952bWiHSODlM%252C_%253BFkYGDlKbmubZNM%252CGVIVM7GHjncykM%252C_%253BJvD09eOePrAOKM%252C4quweExXGeEGZM%252C_%253Bcm_Wg1BlTDa5vM%252CTwlHudSGR4KatM%252C_%253BjVwuN8HtKBpLnM%252CPN-TcZ5ImaGpRM%252C_%253BPT39wWSdWlz_PM%252CBmlZjyL7xGa4eM%252C_&usg=AI4_-kSl-z7SOeiaES8h-CeulpcDUSbnnA&sa=X&ved=2ahUKEwiakujqrer2AhUHyKQKHV85CdAQ9QF6BAgREAE#imgrc=o0STY6lj_-dnoM

                            /*Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.20,
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: Image.asset('assets/carrot.png'),
                        ),
                      ),
                      Text(
                        "OneStack",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.050,
                      ),*/
                           

                            Row(children: [
                              Text(
                                "Grow your", //  Grow
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55,
                                    color: Colors.white),
                                textAlign: TextAlign.start,
                              )
                            ]),
                            Row(children: [
                              Text(
                                "Knowledge", // Connect Grow
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55,
                                    color:
                                        Colors.cyan.shade200.withOpacity(0.8)),
                                textAlign: TextAlign.start,
                              ),
                            ]),
                             Row(children: [
                              Text(
                                "&  ", // Connect Grow
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55,
                                    color:
                                        Colors.white.withOpacity(0.8)),
                                textAlign: TextAlign.start,
                              ),Text(
                                "Earn ", // Connect Grow
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55,
                                    color: Colors.deepPurple.withOpacity(0.9)),
                                textAlign: TextAlign.start,
                              ), 
                            ]),
                             Row(children: [//Grow Your Knowledge, Earn Your Rewards
                              Text(
                                "your ", // Connect Grow
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55,
                                    color: Colors.white),
                                textAlign: TextAlign.start,
                              )
                            ]),
                        Row(children: [//Grow Your Knowledge, Earn Your Rewards
                              Text(
                                "Rewards ", // Connect Grow
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55,
                                    color: Colors.white),
                                textAlign: TextAlign.start,
                              )
                            ]),

                            /*Wrap(
                              children: [
                                Text(
                                  "connect with like-minded people, and  grow.",
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),*/
                          ],
                        )),
                  ),

                  Container(
                    height: 20,
                  ),
                  //Container(height: 100,width: MediaQuery.of(context).size.width,color: Colors.white,)

                  Container(
                    //height: MediaQuery.of(context).size.height * .29,
                    color: Colors.transparent,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.15,
                          child: Container(
                            height: 47,
                            width: 250,
                            //width: MediaQuery.of(context).size.width * 0.86,
                            decoration: BoxDecoration(
                              color: Colors.cyan.shade600.withOpacity(0.8),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                )
                              ],
                            ),
                            child: TextButton(
                                onPressed: (() {
                                  audioCache.play('notificationz.mp3');
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        //  sum = 0;
                                        //var given_list = [1, 2, 3, 4, 5];
                                        bool mon = false;
                                        return SizedBox(
                                            child: Stack(children: [
                                          /*SizedBox.expand(
                  child: Image.asset(
            'assets/openme.jpeg',
            fit: BoxFit.cover,
                  ),
                ),
                              */
                                          //she's said goodbye too many times before
                                          Scaffold(
                                            //backgroundColor: Colors.transparent,
                                            appBar: AppBar(
                                              backgroundColor: Colors.black,
                                              elevation: 0,
                                              leading: SizedBox(),
                                            ),
                                            bottomNavigationBar: Container(
                                                color: Colors.black,
                                                padding: EdgeInsets.all(8.0),
                                                height: 55,
                                                child: Center(
                                                    child: Text(
                                                  "project verf (c)",
                                                  style:
                                                      GoogleFonts.inconsolata(
                                                    color: Colors.green,
                                                    //backgroundColor: Colors.black,
                                                  ),
                                                ))),
                                            body: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.black
                                                        .withOpacity(0.8),
                                                    Colors.black
                                                        .withOpacity(1.0),
                                                    Colors.black
                                                        .withOpacity(1.0)
                                                  ],
                                                  stops: const [0, 0, 0],
                                                ),
                                              ),
                                              child: Card(
                                                elevation: 0,
                                                color: Colors.transparent,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: <Widget>[
                                                      AppBar(
                                                          elevation: 0,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          leading: InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                                Icons
                                                                    .arrow_back,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          title: Text(
                                                            "Log in", //amberlogin
                                                            style: GoogleFonts
                                                                .rubik(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white),
                                                          )),
                                                      SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.30,
                                                          child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Text(
                                                                "Welcome back to OneStack! Log in to your account and pick up where you left off.",
                                                                style: GoogleFonts.rubik(
                                                                    fontSize:
                                                                        22,
                                                                    color: Colors
                                                                        .white),
                                                              ))),
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                            18.0),
                                                        child: Row(children: [
                                                          Text(
                                                            "Username", //changed
                                                            style: GoogleFonts.rubik(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 17,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ]),
                                                      ),
                                                      Padding(
                                                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        child: TextField(
                                                          controller:
                                                              titleController,
                                                          decoration:
                                                              InputDecoration(
                                                            filled: true,
                                                            //fillColor: ,
                                                            fillColor: Colors
                                                                .grey[900],
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0)),
                                                            //labelText: 'Username',
                                                            hintText:
                                                                'Enter your username',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                            18.0),
                                                        child: Row(children: [
                                                          Text(
                                                            "Password", //changed
                                                            style: GoogleFonts
                                                                .rubik(
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ]),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15.0,
                                                                right: 15.0,
                                                                bottom: 0),
                                                        //padding: EdgeInsets.symmetric(horizontal: 15),
                                                        child: TextField(
                                                          controller:
                                                              titleController1,
                                                          obscureText: obsc,
                                                          decoration:
                                                              InputDecoration(
                                                            suffix: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    obsc ?obsc = false:obsc = true;
                                                                  });
                                                                },
                                                                child: !obsc
                                                                    ? Padding(
                                                                      padding: const EdgeInsets.all(3.0),
                                                                      child: Icon(Ionicons
                                                                          .eye_outline,
                                                                          size: 20,
                                                                          color:Colors.white
                                                                          ),
                                                                    )
                                                                    : Padding(
                                                                      padding: const EdgeInsets.all(3.0),
                                                                      child: Icon(Ionicons
                                                                          .eye_off_outline,
                                                                          size: 20,
                                                                          color:Colors.white
                                                                          ),
                                                                    )),
                                                            filled: true,
                                                            fillColor: Colors
                                                                .grey[900],
                                                            //fillColor: Colors.white,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0)),

                                                            //border: OutlineInputBorder(),
                                                            //labelText: 'Password',
                                                            hintText:
                                                                'Enter secure password',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.10,
                                                      ),
                                                      mon
                                                          ? Container(
                                                              child: Column(
                                                                  children: [
                                                                    CircularProgressIndicator(),
                                                                    Container(
                                                                        height:
                                                                            10)
                                                                  ]),
                                                            )
                                                          : SizedBox(),
                                                      titleController.text ==
                                                                  '' &&
                                                              titleController1
                                                                      .text ==
                                                                  ''
                                                          ? Container(
                                                              height: 50,
                                                              width: 350,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .red
                                                                      .shade100,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: TextButton(
                                                                child: Text(
                                                                  "Log in", //changed
                                                                  style: GoogleFonts.rubik(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                onPressed: () {
                                                                  //print(State);
                                                                },
                                                              ),
                                                            )
                                                          : Container(
                                                              height: 50,
                                                              width: 350,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: TextButton(
                                                                child: Text(
                                                                  "Log in", //changed
                                                                  style: GoogleFonts.rubik(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    mon = true;
                                                                  });

                                                                  createAlbum()
                                                                      .whenComplete(
                                                                          () async {
                                                                    final SharedPreferences
                                                                        sharedPreferences =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    sharedPreferences.setString(
                                                                        'token',
                                                                        passtok);
                                                                    sharedPreferences
                                                                        .setString(
                                                                            'key',
                                                                            userid);
                                                                    setState(
                                                                        () {
                                                                      PassToken =
                                                                          passtok;
                                                                    });
                                                                    const snackBar =
                                                                        SnackBar(
                                                                      content: Text(
                                                                          "Just a moment..."),
                                                                    );

                                                                    if (State ==
                                                                        200) {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                MyApp(
                                                                              title: titleController.text,
                                                                              token: passtok,
                                                                              userid: userid,
                                                                            ),
                                                                          ));
                                                                     
                                                                    } else {
                                                                     
                                                                      var snackBar =
                                                                          SnackBar(
                                                                        content: usercorrecion ==
                                                                                null
                                                                            ? Text("something's wrong ")
                                                                            : Text(usercorrecion.toString()),
                                                                      );

                                                                      // Find the ScaffoldMessenger in the widget tree
                                                                      // and use it to show a SnackBar.
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              snackBar);
                                                                    }
                                                                    ;
                                                                  });

                                                                  //print(State);
                                                                },
                                                              ),
                                                            ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 50,
                                                        width: 350,
                                                        decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: TextButton(
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Log in using',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Container(
                                                                    child: Image.asset(
                                                                        "assets/g2.png",
                                                                        height:
                                                                            80,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        width:
                                                                            80,
                                                                        scale:
                                                                            12.0)),
                                                              ]),
                                                          onPressed: () {
                                                            setState(() {
                                                              _signInWithGoogle()
                                                                  .whenComplete(() =>
                                                                      login7().whenComplete(
                                                                          () async {
                                                                        final SharedPreferences
                                                                            sharedPreferences =
                                                                            await SharedPreferences.getInstance();
                                                                        sharedPreferences.setString(
                                                                            'token',
                                                                            passtok);
                                                                        sharedPreferences.setString(
                                                                            'key',
                                                                            userid);
                                                                        setState(
                                                                            () {
                                                                          PassToken =
                                                                              passtok;
                                                                        });
                                                                        if (State ==
                                                                            200) {
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => MyApp(
                                                                                  title: firstnameg + lastnameg,
                                                                                  token: passtok,
                                                                                  userid: userid,
                                                                                ),
                                                                              ));
                                                                        } else {
                                                                     
                                                                          var snackBar =
                                                                              SnackBar(
                                                                            content: usercorrecion == null
                                                                                ? Text("something's wrong ")
                                                                                : Text(usercorrecion.toString()),
                                                                          );

                                                                          // Find the ScaffoldMessenger in the widget tree
                                                                          // and use it to show a SnackBar.
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(snackBar);

                                                                          ;
                                                                        }
                                                                      }));
                                                            }
                                                                // createAlbumX();
                                                                );
                                                          },
                                                        ),
                                                      ),
                                                      Text('' + '\n' + '',
                                                          textAlign:
                                                              TextAlign.center)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ]));
                                      });
                                }),
                                child: Text(
                                  "Log in", //changed
                                  style: GoogleFonts.rubik(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.051,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                color: Colors.grey,
                                height: 0.27,
                                width: MediaQuery.of(context).size.width * .35,
                              ),
                              Text("or", style: TextStyle(color: Colors.white)),
                              Container(
                                color: Colors.grey,
                                height: 0.27,
                                width: MediaQuery.of(context).size.width * .35,
                              )
                            ]),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.14,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.66,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.9),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                )
                              ],
                            ),
                            child: TextButton(
                                onPressed: (() {
                                  audioCache.play('notificationz.mp3');
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        //  sum = 0;
                                        //var given_list = [1, 2, 3, 4, 5];

                                        return Scaffold(
                                          backgroundColor: Colors.black,
                                          appBar: AppBar(
                                            centerTitle: true,
                                            elevation: 0.0,
                                            backgroundColor: Colors.black,
                                            leading: Container(),
                                            title: Text("",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black)),
                                          ),
                                          body: SingleChildScrollView(
                                            child: Column(
                                              children: <Widget>[
                                                AppBar(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        Colors.black,
                                                    leading: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Icon(
                                                            Icons.arrow_back,
                                                            color:
                                                                Colors.white)),
                                                    title: Text("Sign Up",
                                                        style:
                                                            GoogleFonts.rubik(
                                                                color: Colors
                                                                    .white))),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03,
                                                ),
                                                Container(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Text(
                                                        "We are thrilled to have you join our community. OneStack is not just an app; it's a platform where you can explore new possibilities.",
                                                        style:
                                                            GoogleFonts.rubik(
                                                                fontSize: 19,
                                                                color: Colors
                                                                    .white))),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .6,
                                                          child: Padding(
                                                            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15),
                                                            child: TextField(
                                                              controller:
                                                                  titleController4,
                                                              decoration:
                                                                  InputDecoration(
                                                                //focusColor: Colors.red,
                                                                filled: true,
                                                                fillColor:
                                                                    Colors.grey[
                                                                        900],
                                                                //fillColor: Colors.white,
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0)),
                                                                //labelText: 'First name',
                                                                hintText:
                                                                    'firstname',
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .4,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 15.0,
                                                                    right: 15.0,
                                                                    top: 15,
                                                                    bottom:
                                                                        15.0),
                                                            child: TextField(
                                                              controller:
                                                                  titleControllerv,
                                                              decoration:
                                                                  InputDecoration(
                                                                filled: true,
                                                                fillColor:
                                                                    Colors.grey[
                                                                        900],
                                                                //fillColor: Colors.white,
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0)),
                                                                //labelText: 'Second name',
                                                                hintText:
                                                                    'secondname',
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15.0,
                                                          //top: 15,
                                                          bottom: 0),
                                                  //padding: EdgeInsets.symmetric(horizontal: 15),
                                                  child: TextField(
                                                    controller:
                                                        titleController3,
                                                    //obscureText: true,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Colors.grey[900],
                                                      //fillColor: Colors.white,
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0)),

                                                      //border: OutlineInputBorder(),
                                                      //labelText: 'Email',
                                                      hintText: 'Email',
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15.0,
                                                          top: 15,
                                                          bottom: 0),
                                                  //padding: EdgeInsets.symmetric(horizontal: 15),
                                                  child: TextField(
                                                    controller: titleController,
                                                    //obscureText: true,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Colors.grey[900],
                                                      //fillColor: Colors.white,
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0)),

                                                      //border: OutlineInputBorder(),
                                                      //labelText: 'Username',
                                                      hintText: 'Username',
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15.0,
                                                                top: 15.0,
                                                                right: 15.0,
                                                                bottom: 0),
                                                        //padding: EdgeInsets.symmetric(horizontal: 15),
                                                        child: TextField(
                                                          controller:
                                                              titleController1,
                                                          obscureText: obsc,
                                                          decoration:
                                                              InputDecoration(
                                                            suffix: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    obsc ?obsc = false:obsc = true;
                                                                  });
                                                                },
                                                                child: !obsc
                                                                    ? Padding(
                                                                      padding: const EdgeInsets.all(3.0),
                                                                      child: Icon(Ionicons
                                                                          .eye_outline,
                                                                          size: 20,
                                                                          color:Colors.white
                                                                          ),
                                                                    )
                                                                    : Padding(
                                                                      padding: const EdgeInsets.all(3.0),
                                                                      child: Icon(Ionicons
                                                                          .eye_off_outline,
                                                                          size: 20,
                                                                          color:Colors.white
                                                                          ),
                                                                    )),
                                                            filled: true,
                                                            fillColor: Colors
                                                                .grey[900],
                                                            //fillColor: Colors.white,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0)),

                                                            //border: OutlineInputBorder(),
                                                            //labelText: 'Password',
                                                            hintText:
                                                                'Enter secure password',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 250,
                                                  decoration: BoxDecoration(
                                                      color: titleController
                                                                      .text ==
                                                                  '' &&
                                                              titleController1
                                                                      .text ==
                                                                  ''
                                                          ? Colors.red.shade100
                                                          : Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        create1().whenComplete(
                                                            () async {
                                                          final SharedPreferences
                                                              sharedPreferences =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          sharedPreferences
                                                              .setString(
                                                                  'token',
                                                                  passtok);
                                                          sharedPreferences
                                                              .setString('key',
                                                                  userid);
                                                          setState(() {
                                                            PassToken = passtok;
                                                          });
                                                          if (State == 201) {
                                                            audioCache.play(
                                                                'notification.mp3');
                                                            showModalBottomSheet(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Container(
                                                                  child: Center(
                                                                      child: Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                        Text(
                                                                            "User Account Created",
                                                                            style: GoogleFonts.rubik(
                                                                                fontSize: 20,
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.normal)),
                                                                        Container(
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              250,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.red,
                                                                              borderRadius: BorderRadius.circular(10)),
                                                                          child:
                                                                              TextButton(
                                                                            child:
                                                                                Text(
                                                                              'Login',
                                                                              style: TextStyle(color: Colors.white, fontSize: 25),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              audioCache.play('notificationz.mp3');
                                                                              createAlbum().whenComplete(() async {
                                                                                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                                                                sharedPreferences.setString('token', passtok);
                                                                                sharedPreferences.setString('key', userid);
                                                                                setState(() {
                                                                                  PassToken = passtok;
                                                                                });
                                                                                Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                      builder: (context) => MyApp(
                                                                                        title: titleController.text,
                                                                                        token: passtok,
                                                                                        userid: userid,
                                                                                      ),
                                                                                    ));
                                                                              });

                                                                              //print(State);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ])),
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                           
                                                            var snackBar =
                                                                SnackBar(
                                                              content: usercorrecion ==
                                                                      null
                                                                  ? Text(
                                                                      "something's wrong ")
                                                                  : Text(usercorrecion
                                                                      .toString()),
                                                            );

                                                            // Find the ScaffoldMessenger in the widget tree
                                                            // and use it to show a SnackBar.
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar);

                                                            ;
                                                          }
                                                        });
                                                      }
                                                          // createAlbumX();
                                                          );
                                                    },
                                                    child: State == 400
                                                        ? Text(
                                                            'Continue',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 25),
                                                          )
                                                        : Text(
                                                            'Continue',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 25),
                                                          ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 350,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: TextButton(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Continue with',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Container(
                                                              child: Image.asset(
                                                                  "assets/g2.png",
                                                                  height: 80,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 80,
                                                                  scale: 12.0)),
                                                        ]),
                                                    onPressed: () {
                                                      setState(() {
                                                        _signInWithGoogle()
                                                            .whenComplete(() =>
                                                                create2()
                                                                    .whenComplete(
                                                                        () async {
                                                                  final SharedPreferences
                                                                      sharedPreferences =
                                                                      await SharedPreferences
                                                                          .getInstance();
                                                                  sharedPreferences
                                                                      .setString(
                                                                          'token',
                                                                          passtok);
                                                                  sharedPreferences
                                                                      .setString(
                                                                          'key',
                                                                          userid);
                                                                  setState(() {
                                                                    PassToken =
                                                                        passtok;
                                                                  });
                                                                  if (State ==
                                                                      201) {
                                                                    audioCache.play(
                                                                        'notification.mp3');
                                                                    createpic();
                                                                    showModalBottomSheet(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .black,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Container(
                                                                          child: Center(
                                                                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                                                            Text("User Account Created",
                                                                                style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white)),
                                                                            Container(
                                                                              height: 50,
                                                                              width: 250,
                                                                              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                                                                              child: TextButton(
                                                                                child: Text(
                                                                                  'Login',
                                                                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                                                                ),
                                                                                onPressed: () {
                                                                                  audioCache.play('notificationz.mp3');
                                                                                  login7().whenComplete(() async {
                                                                                    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                                                                    sharedPreferences.setString('token', passtok);
                                                                                    sharedPreferences.setString('key', userid);
                                                                                    setState(() {
                                                                                      PassToken = passtok;
                                                                                    });
                                                                                    Navigator.push(
                                                                                        context,
                                                                                        MaterialPageRoute(
                                                                                          builder: (context) => MyApp(
                                                                                            title: titleController.text,
                                                                                            token: passtok,
                                                                                            userid: userid,
                                                                                          ),
                                                                                        ));
                                                                                  });

                                                                                  //print(State);
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ])),
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                   
                                                                    var snackBar =
                                                                        SnackBar(
                                                                      content: usercorrecion ==
                                                                              null
                                                                          ? Text(
                                                                              "something's wrong ")
                                                                          : Text(
                                                                              usercorrecion.toString()),
                                                                    );

                                                                    // Find the ScaffoldMessenger in the widget tree
                                                                    // and use it to show a SnackBar.
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                            snackBar);

                                                                    ;
                                                                  }
                                                                }));
                                                      }
                                                          // createAlbumX();
                                                          );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          bottomNavigationBar: Container(
                                              padding: EdgeInsets.all(10.0),
                                              height: 120,
                                              child: Center(
                                                  child: Wrap(children: [
                                                Text(
                                                  "By clicking on Continue, you are agreeing to our ",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                legal2(
                                                                    darkmode:
                                                                        false) //screen(),
                                                            ), //MaterialPageRoute
                                                      );
                                                    },
                                                    child: Text(
                                                      "terms and conditions",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          //fontSize: 20,
                                                          color: Colors.blue),
                                                    )),
                                                Text(
                                                  " and are acknowledging our ",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                legal1(
                                                                    darkmode:
                                                                        false) //screen(),
                                                            ), //MaterialPageRoute
                                                      );
                                                    },
                                                    child: Text(
                                                      "Policy",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          //fontSize: 20,
                                                          color: Colors.blue),
                                                    )),
                                                Text(
                                                  "applies. \n",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),

                                                //Text("We take your privacy very seriously and want to assure you that any information collected during the sign-up process is strictly used for the functionality of our app.")
                                              ]))),
                                        );
                                      });
                                }),
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.rubik(
                                      //fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                        SizedBox(height: 20),
                        /*Center(
                  child: Wrap(children: [
                Text("By Signing in to our app, you are agreeing to our "),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                legal2(darkmode: false) //screen(),
                            ), //MaterialPageRoute
                      );
                    },
                    child: Text(
                      "terms and conditions",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          //fontSize: 20,
                          color: Colors.green),
                    ))
              ]))*/
                      ]),
                    ),
                  ),
                  Container(height: 50),
                ]),
              ))),
        ),
      ),
    ]));
  }
}
