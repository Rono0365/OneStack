//don't delete the commented stuff
//it holds important code
//might be useful insome scenarios

import 'dart:async';

import 'package:OneStack/compchat/chatme.dart';
import 'package:OneStack/newchat/sortedchat.dart';
import 'package:OneStack/notifications/comment9.dart';
import 'package:OneStack/notifications/notifications.dart';
import 'package:OneStack/pages/chat.dart';

import 'package:OneStack/newchat/newchat.dart';
import 'package:OneStack/pages/dashboard.dart';
import 'package:OneStack/pages/editprofile.dart';
import 'package:OneStack/pages/profile2.dart';
import 'package:OneStack/pages/profiletest.dart';
import 'package:OneStack/pages/rooms.dart';
import 'package:OneStack/posts/postevent.dart';
import 'package:OneStack/posts/postoclub.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:OneStack/pages/events.dart';
import 'package:OneStack/pages/network.dart';
import 'package:OneStack/pages/profile.dart';
import 'package:OneStack/pages/work.dart';
import 'intro_pageview.dart';
import 'splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:OneStack/widgets/bottomnav.dart';
import 'package:OneStack/pages/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: screen()));
}

class MyApp extends StatefulWidget {
  const MyApp(
      {key, required this.title, required this.token, required this.userid});

  final String token;
  final String title;
  final String userid;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Verf',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: WillPopScope(
            onWillPop: () async {
              // Return true to prevent the user from going back.
              return false;
            },
            child: intrpage(
              title: "Onestack",
              token: widget.token,
              userid: widget.userid,
            ) // MyHomePage(title: 'OneStack'),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {key, required this.title, required this.token, required this.userid});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String token;
  final String userid;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();

  int _counter = 0;
  var sky = [];
  var sky2 = {};
  var sky3 = [];
  var pic_url = [];
  var oldstuff = [];
  var thislove = '';
  var messages = [];
  bool open3 = false;
  var now;
  bool onApp = true;
  bool newchat = false;
  var leo;
  var note7;
  var titleController;
  var information = [];
  bool ee7 = false;
  bool ee8 = false;
  int _currentIndex = 0;

  Future getMe() async {
    String token = widget.token.toString();
    String id = widget.userid.toString();

    ////print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
      'Content-Type': 'application/json'
    };
    http.Response responsev = await http
        .get(Uri.parse('https://afleet.co.ke/meff/$id'), headers: headers);

    http.Response responsev1 = await http
        .get(Uri.parse('https://afleet.co.ke/information/'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    var xcv1 = jsonDecode(responsev1.body);
    setState(() {
      this.sky2 = xcv;
      this.information = xcv1;
    });
    ////print(sky2);
  }

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky3', json.encode(sky3));
    sharedPreferences.setString('sky2', json.encode(sky2));
    sharedPreferences.setString('sky', json.encode(sky));
    sharedPreferences.setBool('ee7', ee7);
    sharedPreferences.setBool('ee8', ee8);
    //var passed5 = jsonDecode(sharedPreferences.getString('ee7'));
    //var passed6 = jsonDecode(sharedPreferences.getString('ee8'));
    //var sky;
    //var sky2;
    //var sky3;
    //sharedPreferences.setString('passed', "passed");
  }

  Future getWeather3x() async {
    String token = widget.token.toString();
    String id = widget.userid.toString();

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
    http.Response responsev2 = await http
        .get(Uri.parse('https://afleet.co.ke/meff/$id'), headers: headers);
    var results = jsonDecode(responsev.body);
    var results2 = jsonDecode(responsev2.body);
    setState(() {
      this.sky3 = results;
      this.pic_url = picpic;
      this.sky2 = results2;
      inm();
    });
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode(sharedPreferences.getString('pic_url')); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky3'));
    var passeD3 = jsonDecode(sharedPreferences.getString('sky2'));
    var passed4 = jsonDecode(sharedPreferences.getString('sky'));
    var passed5 = sharedPreferences.getBool('ee7');
    var passed6 = sharedPreferences.getBool('ee8');

    setState(() {
    this.pic_url = passed;
    this.sky3 = passed2;
    this.sky2 = passeD3;
    this.sky = passed4;
    this.ee7 = passed5;
    this.ee8 = passed6;
    });
      }

  bess() {
    var counter = 90;
    Timer.periodic(Duration(seconds: 5), (timer) {
      //http req to  and from server
      counter++;

      if (counter == 0) {
        //counter = 15;

        //timer.cancel();
      } else {
        this.retrieveMessages(sky2["username"]);
        messages.length >= 1 ? this.menw(messages) : "";
      }
    });
  }

  @override
  void initState() {
     onApp = true;
    getValidation();
    getMe();
    getWeather3x();

    retrieveMessages(sky2["username"]);
    bess();
    getstacks();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    inm();
    
      onApp = false;
    
  }

  String menw3(List z) {
    //time
    var w = z.where((e) => e != null).toList();

    var y = '';

    if (w.length > 1) {
      var x = w;
      y = x[3].toString();
    }

    return y;
  }

  getme2(String qx) {
    final x2 = messages != null ? messages : [];
    // final v = x.last;
    final mess2 = x2.map((z) => z[1]);
    //final mess = x.map((z)=>z[1]);
    final list_of_mes2 = mess2.where((x1) => x1[0] == "$qx");
    //final list_of_mes= mess.where((x1)=>x1[0] == "RetRono");//here get the righth users
    return list_of_mes2.toList();
  }

  getFirstTwoValues2(List list) {
    List a = list;
    var b = menw3(a);
    return b.toString();
  }

  note(String x, String y) {
    var q;
    return Ninotify.showNotification(
      id: 1,
      title: "Message from ${x}",
      body: messages.last[1][1].toString(),
      payload: 'r',
    );
  }

  lastmess(var z) {
    var k = z.split("],").where((e) => e != null).last;
    return k
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(",", "|")
        .split("|");
  }

  void retrieveMessages(String room) async {
    final url =
        Uri.parse('https://onestack-verfchat.onrender.com/messages/${room}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final messageList = data['messages']; //
      setState(() {
        this.messages = messageList;

        //retrievep(mUsername);
      });
    } else {
      //print('Failed to retrieve messages. Error: ${response.statusCode}');
    }
  }

  List<dynamic> menw(List<dynamic> z) {
    // this is A masterpiece
    List<dynamic> up = oldstuff;
    List<dynamic> w = z.isEmpty
        ? []
        : z.reversed
            .where((element) =>
                element.length > 1 &&
                element[1].length > 0 &&
                element[1][0] != null)
            .map((e) => e[1][0])
            .toSet()
            .toList();

    if (thislove != getFirstTwoValues2(lastmess(getme2(w.first).toString()))) {
      //audioCache.play('postsmth.mp3');
  !ee7 ?"": note(w.first.toString(), w.toString())
      ;//!onApp ? note(w.first.toString(), w.toString()) : ""; //remove this on app
      setState(() {
        ee7 = true;
      });

      up.remove(getFirstTwoValues2(lastmess(getme2(w.first).toString())));
    }

    List<dynamic> itemsNotInUp = w.where((item) => !up.contains(item)).toList();

    setState(() {
      this.thislove = getFirstTwoValues2(lastmess(getme2(w.first).toString()));
    });

    return itemsNotInUp;
  }

  Widget bN(String pressed, String Page) {
    return sky2 == "" && pic_url == ""
        ? Container(
            color: Colors.grey[900],
            child: Center(child: LinearProgressIndicator()))
        : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(1.0)
                ],
                stops: const [0.1, 0.7, 1],
              ),
            ),
            height: 100,
            //color: Colors.black.withOpacity(.85),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    //_pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

                    setState(() {
                      _pageController.animateToPage(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);

                      _currentIndex = 0;
                    });
                    inm();
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        Colors.transparent, //no outlineColors.cyan.shade600
                    child: Icon(
                        pressed == "0" ? EvaIcons.home : EvaIcons.homeOutline,
                        size: pressed == "0" ? 32 : 27,
                        color: pressed == "0"
                            ? Colors.cyan.shade600
                            : Colors
                                .white), //Icon(Ionicons.home_outline,color: Colors.cyan.shade600,),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pageController.animateToPage(1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      _currentIndex = 1;
                      ee7 = false;
                      // pressed = "Network";
                    });
                    inm();
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                            pressed == "1"
                                ? Ionicons.chatbubbles
                                : Ionicons.chatbubbles_outline,
                            size: pressed == "1" ? 32 : 27,
                            color: pressed == "1"
                                ? Colors.cyan.shade600
                                : Colors.white),
                      ),
                      ee7
                              ? Positioned(
                                  right: 2,
                                  top: 2,
                                  child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.black,
                                      child: Center(
                                          child: CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Colors.red,
                                        child: Text(
                                          "", //add stuff here
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))))
                              : SizedBox()
                    ],
                  ),
                ),
                /*InkWell(
                  onTap: () {
                    setState(() {
                      _pageController.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      _currentIndex = 2;
                      //pressed = "Work";
                    });
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                        pressed == "2"
                            ? Ionicons.briefcase
                            : Ionicons.briefcase_outline,
                        color: pressed == "2"
                            ? Colors.cyan.shade600
                            : Colors.white),
                  ),
                ),*/
                InkWell(
                  onTap: () {
                    setState(() {
                      _pageController.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      _currentIndex = 3;
                      //pressed = "3";
                    });
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                     pressed == "3" ? Ionicons.stats_chart:Ionicons.stats_chart_outline,
                      size: pressed == "3" ? 32 : 27,
                      color:
                          pressed == "3" ? Colors.cyan.shade600 : Colors.white,
                    ),
                  ),
                ),
               /* pressed == "4"
                    ? Container(
                        child: Stack(children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.cyan.shade600,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.cyan.shade100,
                              child: Center(
                                child: Text(
                                  sky2["username"].toString().substring(0, 1),
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan.shade600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ...pic_url == ""
                              ? [
                                  {
                                    "id": 126,
                                    "username1": "RonoRet",
                                    "image":
                                        "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                  },
                                  {
                                    "id": 127,
                                    "username1": "RetRono",
                                    "image":
                                        "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                  }
                                ]
                                  .where((c) =>
                                      c['username1'] ==
                                      sky2['username'].toString())
                                  .map(
                                    (ui) => CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.cyan.shade600,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,

                                        backgroundImage: NetworkImage(
                                          ui['image'].toString(),
                                        ), //ui['image'],
                                      ),
                                    ),
                                  )
                              : pic_url
                                  .where((c) =>
                                      c['username1'] ==
                                      sky2['username'].toString())
                                  .map(
                                    (ui) => CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.cyan.shade600,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,

                                        backgroundImage: NetworkImage(
                                          ui['image'].replaceAll(" ", ''),
                                        ), //ui['image'],
                                      ),
                                    ),
                                  ),
                        ]),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            _pageController.animateToPage(4,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                            _currentIndex = 4;
                          });
                        },
                        child: Container(
                          child: Stack(children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.cyan.shade100,
                              child: Center(
                                child: Text(
                                  sky2["username"].toString().substring(0, 1),
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan.shade600,
                                  ),
                                ),
                              ),
                            ),
                            ...pic_url == null
                                ? [
                                    {
                                      "id": 126,
                                      "username1": "RonoRet",
                                      "image":
                                          "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                    },
                                    {
                                      "id": 127,
                                      "username1": "RetRono",
                                      "image":
                                          "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                    }
                                  ]
                                    .where((c) =>
                                        c['username1'] ==
                                        (sky2 == "" ? "" : sky2['username']))
                                    .map(
                                      (ui) => CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.cyan.shade600,
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.transparent,

                                          backgroundImage: NetworkImage(
                                            ui['image'].toString(),
                                          ), //ui['image'],
                                        ),
                                      ),
                                    )
                                : pic_url
                                    .where((c) =>
                                        c['username1'] ==
                                        (sky2 == null
                                            ? ""
                                            : "${sky2['username']}"))
                                    .map((ui) => CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.transparent,

                                          backgroundImage: NetworkImage(
                                            ui['image']
                                                .toString()
                                                .replaceAll(" ", ''),
                                          ), //ui['image'],
                                        )),
                          ]),
                        )),*/
              ],
            )),
          );
  }

  getstacks() {
    /*
   information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .length
                                                    .toString()
  */
    var k = information
        .where((x) => x["writer"] == sky2["username"])
        .where((u) => u['title'].contains('mop'))
        .where((f) => f['id'] != null);
    var n = k
        .toList()
        .map((x) => information
            .where((u) =>
                u['title'].contains('message') &&
                u["writer"] != sky2["username"] &&
                u['whoiswho'] == x['id'].toString())
            .length
            .toString())
        .toList();
    ;
    setState(() {
      note7 !=
              n
                  .fold(
                      0,
                      (previousValue, element) =>
                          int.parse(previousValue.toString()) +
                          int.parse(element.toString()))
                  .toString()
          ? ee8 = true
          : "";
    });
    return n
        .fold(
            0,
            (previousValue, element) =>
                int.parse(previousValue.toString()) +
                int.parse(element.toString()))
        .toString();
  }

  stacknotes() {
    /*
   information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .length
                                                    .toString()
  */
    var k = information
        .where((x) => x["writer"] == sky2["username"])
        .where((u) => u['title'].contains('mop'))
        .where((f) => f['id'] != null);
    var n = k
        .toList()
        .map((x) => information
            .where((u) =>
                u['title'].contains('message') &&
                u["writer"] != sky2["username"] &&
                u['whoiswho'] == x['id'].toString())
            .length
            .toString())
        .toList();
    ;
    setState(() {
      note7 = n
          .fold(
              0,
              (previousValue, element) =>
                  int.parse(previousValue.toString()) +
                  int.parse(element.toString()))
          .toString();
    });

    return n
        .fold(
            0,
            (previousValue, element) =>
                int.parse(previousValue.toString()) +
                int.parse(element.toString()))
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    retrieveMessages(sky2["username"]);
    messages.length >= 1 ? menw(messages) : "";
    return WillPopScope(
      onWillPop: () async {
        // Return true to prevent the user from going back.
        return false;
      },
      child: sky2.toString().split(",").length <= 1 &&
              pic_url.toString().split(",").length <= 1
          ? Scaffold(
              backgroundColor: Colors.grey[900],
              body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              extendBody: true,

              extendBodyBehindAppBar:
                  _currentIndex != 4 && _currentIndex != 3 ? false : true,
              // _currentIndex != 4?
              appBar: AppBar(
                //extendBodybehindAppBAr:true,
                elevation: 0,
                //leading: SizedBox(),
                //centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: _currentIndex != 4 && _currentIndex != 3
                    ? Colors.black.withOpacity(0.9)
                    : Colors.black.withOpacity(0.1),
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Row(children: [
                  Text(
                    "One",
                    style: GoogleFonts.inconsolata(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Stack",
                    style: GoogleFonts.inconsolata(
                      fontSize: 24,
                      color: Colors.cyan.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
                actions: [
                  InkWell(
                    onTap: () {
                      
                     /* showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return GridViewPage(
                              token: widget.token,
                            pic_url: pic_url,
                            information:information,
                            username: sky2['username'],
                          listOfStuff: sky3.reversed
                                                      .where((k) =>
                                                          k["username"] ==
                                                          sky2["username"])
                                                      .take(1)
                                                      .toList()
                                                      .map(
                                                        (e) => e['skills']
                                                            .replaceAll("[", "")
                                                            .replaceAll(" ", "")
                                                            .replaceAll("]", "")
                                                            .split(','),
                                                      )
                                                      .toList(),
                          ); /*ChatScreen(
pic_url:pic_url

                          );*/ /*chatpage(
                            userid: int.parse(widget.userid),
                            username: sky2['username'],
                            token: widget.token,
                            students: sky3.toList(),
                          );*/
                        },
                      );
                      main8();*/
                      
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                    CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: const Icon(
                              Ionicons.search,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        ee8 = false;
                      });
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return NotificationPage(
                              username: sky2["username"],
                              token: widget.token,
                              information: information,
                              pics: pic_url,
                            );
                          });
                      //main8();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: Icon(Ionicons.notifications,
                                color: Colors.white),
                          ),
                          ee8 && int.parse(stacknotes()) > 4
                              ? Positioned(
                                  right: 4,
                                  top: 4,
                                  child: Container(
                                    padding: EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          stacknotes(), //add stuff here
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ))
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return editprofile(
                              pics: pic_url,
                              username: sky2["username"],
                              userid: int.parse(widget.userid),
                              token: widget.token,
                            );
                          });
                    },
                    child: Container(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Stack(children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.cyan.shade100,
                              child: Center(
                                child: Text(
                                  sky2["username"].toString().substring(0, 1),
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan.shade600,
                                  ),
                                ),
                              ),
                            ),
                            ...pic_url == ""
                                ? [
                                    {
                                      "id": 126,
                                      "username1": "RonoRet",
                                      "image":
                                          "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                    },
                                    {
                                      "id": 127,
                                      "username1": "RetRono",
                                      "image":
                                          "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                    }
                                  ]
                                    .where((c) =>
                                        c['username1'] ==
                                        sky2['username'].toString())
                                    .map(
                                      (ui) => CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.cyan.shade600,
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.transparent,

                                          backgroundImage: NetworkImage(
                                            ui['image'].toString(),
                                          ), //ui['image'],
                                        ),
                                      ),
                                    )
                                : pic_url
                                    .where((c) =>
                                        c['username1'] ==
                                        sky2['username'].toString())
                                    .map(
                                      (ui) => CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,

                                        backgroundImage: NetworkImage(
                                          ui['image'].replaceAll(" ", ''),
                                        ), //ui['image'],
                                      ),
                                    ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                  Container(width: 5)
                ],
              ), //_pageController.animateToPage(2, duration: Duration(milliseconds: 500));

              bottomNavigationBar: //sky3
                  sky2 == null ? Container() : bN(_currentIndex.toString(), ""),
              /*
                  Controller.animateToPage(2, duration: Duration(milliseconds: 500));
                  */
              body: sky2 == ""
                  ? Scaffold(
                      backgroundColor: Colors.grey[900],
                      body: Center(child: CircularProgressIndicator()))
                  : PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: [
                          sky2['username'] != null
                              ? CRMDashboard()/*Home1(
                                  pic_url: pic_url,
                                  username: sky2['username'],
                                  information:information,
                                  token: widget.token,
                                  //information: information,
                                )*/
                              : Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Center(
                                      child: CircularProgressIndicator())),
                       SortChat(
                            token: widget.token,
                            userid: widget.userid,
                            pics: pic_url,
                            mUsername: sky2['username'],
                          )   ,
                          /*work(
                            token: widget.token,
                            userid: int.parse(widget.userid), //widget.userid,
                            username: sky2['username'], //sky2['username'],
                          ),*/
                          event(
                            pics: pic_url,
                            sky2: sky3,
                            token: widget.token,
                            userid: int.parse(widget.userid), //widget.userid,
                            username: sky2['username'],
                          ),
                          profile(
                            pics: pic_url,
                            unfo:sky3,
                            information: information,
                            token: widget.token,
                            userid: int.parse(widget.userid), //widget.userid,
                            username: sky2['username'],
                          )
                        ]),
              floatingActionButton: _currentIndex != 0 &&
                      _currentIndex != 2 &&
                      _currentIndex != 3
                  ? _currentIndex == 1?
                  Container(
                    child:FloatingActionButton(
          backgroundColor: Colors.cyan.shade600,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => network(
                          userid: int.parse(widget.userid),
                          username: '${sky2["username"]}',
                          token: widget.token,
                        )));
          },
          child: Icon(Ionicons.chatbubble)),
                  )
                  :Container()
                  : Container(
                    height:270,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        !open3?SizedBox():  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              tooltip:"Add to revenue",
                               backgroundColor: Colors.deepPurple.shade900,
                              mini:true,
                              onPressed: () {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                //  sum = 0;
                                                //var given_list = [1, 2, 3, 4, 5];
                          
                                                return postM(
                                                    name: sky2["username"],
                                                    image: pic_url,
                                                    token: widget.token,
                                                    topics: sky3.reversed
                                                        .where((k) =>
                                                            k["username"] ==
                                                            sky2["username"])
                                                        .take(1)
                                                        .toList()
                                                        .map(
                                                          (e) => e['skills']
                                                              .replaceAll("[", "")
                                                              .replaceAll(" ", "")
                                                              .replaceAll("]", "")
                                                              .split(','),
                                                        )
                                                        .toList());
                                              });
                                        },
                                        child: Icon(Icons.add_card_outlined)),
                          ),
                                     !open3?SizedBox(): Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FloatingActionButton(
                                                                        backgroundColor: Colors.deepPurple.shade900,

                                         tooltip:"Add Task",
                                          mini:true,
                                          onPressed: () {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                //  sum = 0;
                                                //var given_list = [1, 2, 3, 4, 5];
                                      
                                                return postM(
                                                    name: sky2["username"],
                                                    image: pic_url,
                                                    token: widget.token,
                                                    topics: sky3.reversed
                                                        .where((k) =>
                                                            k["username"] ==
                                                            sky2["username"])
                                                        .take(1)
                                                        .toList()
                                                        .map(
                                                          (e) => e['skills']
                                                              .replaceAll("[", "")
                                                              .replaceAll(" ", "")
                                                              .replaceAll("]", "")
                                                              .split(','),
                                                        )
                                                        .toList());
                                              });
                                        },
                                        child: Icon(Icons.edit_calendar)),
                                      ),
                         !open3?SizedBox(): Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                               backgroundColor: Colors.deepPurple.shade900,
                               tooltip:"Add event",
                              mini:true,
                              onPressed: () {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                //  sum = 0;
                                                //var given_list = [1, 2, 3, 4, 5];
                          
                                                return postM(
                                                    name: sky2["username"],
                                                    image: pic_url,
                                                    token: widget.token,
                                                    topics: sky3.reversed
                                                        .where((k) =>
                                                            k["username"] ==
                                                            sky2["username"])
                                                        .take(1)
                                                        .toList()
                                                        .map(
                                                          (e) => e['skills']
                                                              .replaceAll("[", "")
                                                              .replaceAll(" ", "")
                                                              .replaceAll("]", "")
                                                              .split(','),
                                                        )
                                                        .toList());
                                              });
                                        },
                                        child: Icon(Ionicons.calendar_outline)),
                          ),
                          FloatingActionButton(
                              backgroundColor: Colors.cyan.shade600,
                              onPressed: () {},
                              tooltip: 'Post',
                              child: _currentIndex != 2 && _currentIndex != 3
                                  ? InkWell(
                                      onTap: () {

                                        setState(() {
                                          !open3 ?this.open3 = true:this.open3 = false;
                                        });
                                        /*showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              //  sum = 0;
                                              //var given_list = [1, 2, 3, 4, 5];

                                              return postM(
                                                  name: sky2["username"],
                                                  image: pic_url,
                                                  token: widget.token,
                                                  topics: sky3.reversed
                                                      .where((k) =>
                                                          k["username"] ==
                                                          sky2["username"])
                                                      .take(1)
                                                      .toList()
                                                      .map(
                                                        (e) => e['skills']
                                                            .replaceAll("[", "")
                                                            .replaceAll(" ", "")
                                                            .replaceAll("]", "")
                                                            .split(','),
                                                      )
                                                      .toList());
                                            });*/
                                      },
                                      child: Icon(Icons.create))
                                  : _currentIndex != 3
                                      ? Icon(Icons.add)
                                      : InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                builder: (context) {
                                                  //  sum = 0;
                                                  //var given_list = [1, 2, 3, 4, 5];

                                                  return postE(
                                                      name: sky2["username"],
                                                      image: pic_url,
                                                      token: widget.token,
                                                      topics: sky3.reversed
                                                          .where((k) =>
                                                              k["username"] ==
                                                              sky2["username"])
                                                          .take(1)
                                                          .toList()
                                                          .map(
                                                            (e) => e['skills']
                                                                .replaceAll("[", "")
                                                                .replaceAll(" ", "")
                                                                .replaceAll("]", "")
                                                                .split(','),
                                                          )
                                                          .toList());
                                                });
                                          },
                                          child: Icon(Ionicons.add_outline),
                                        )),
                        ],
                      ),
                    ), // This trailing comma makes auto-formatting nicer for build methods.
            ),
    );
  }
}
