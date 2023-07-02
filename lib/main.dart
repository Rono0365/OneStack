import 'package:OneStack/compchat/chatme.dart';
import 'package:OneStack/pages/chat.dart';
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
              title: "Wave",
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
  var sky;
  var sky2;
  var sky3;
  var pic_url;
  var now;
  var leo;
  var titleController;
  //var information;
  int _currentIndex = 0;

  Future getMe() async {
    String token = widget.token.toString();
    String id = widget.userid.toString();

    print('here' + token);
    print('here' + id);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
      'Content-Type': 'application/json'
    };
    http.Response responsev = await http
        .get(Uri.parse('https://afleet.co.ke/meff/$id'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    setState(() {
      sky2 = xcv;
    });
    //print(sky2);
  }

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky3', json.encode(sky3));
    sharedPreferences.setString('sky2', json.encode(sky2));
    sharedPreferences.setString('sky', json.encode(sky));
    //var sky;
    //var sky2;
    //var sky3;
    //sharedPreferences.setString('passed', "passed");
  }

  Future getWeather3x() async {
    String token = widget.token.toString();
    String id = widget.userid.toString();
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
    http.Response responsev2 = await http
        .get(Uri.parse('https://afleet.co.ke/meff/$id'), headers: headers);
    var results = jsonDecode(responsev.body);
    var results2 = jsonDecode(responsev2.body);
    setState(() {
      this.sky3 = results;
      this.pic_url = picpic;
      this.sky2 = results2;
    });
    inm();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode(sharedPreferences.getString('pic_url')); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky3'));
    var passeD3 = jsonDecode(sharedPreferences.getString('sky2'));
    var passed4 = jsonDecode(sharedPreferences.getString('sky'));

    setState(() {
      this.pic_url = passed;
      this.sky3 = passed2;
      this.sky2 = passeD3;
      this.sky = passed4;
    });
    getWeather3x();
  }

  @override
  void initState() {
    getValidation();
    getMe();
    getWeather3x();

    inm();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(1.0)
                ],
                stops: const [0.1, 0.6, 1],
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
                    //inm();
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        Colors.transparent, //no outlineColors.cyan.shade600
                    child: Icon(
                        pressed == "0" ? EvaIcons.home : EvaIcons.homeOutline,
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
                      // pressed = "Network";
                    });
                    inm();
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                        pressed == "1" ? Icons.groups : Icons.groups_outlined,
                        color: pressed == "1"
                            ? Colors.cyan.shade600
                            : Colors.white),
                  ),
                ),
                InkWell(
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
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pageController.animateToPage(3,
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
                      Ionicons.calendar_outline,
                      color:
                          pressed == "3" ? Colors.cyan.shade600 : Colors.white,
                    ),
                  ),
                ),
                pressed == "4"
                    ? Container(
                        child: Stack(children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.cyan.shade600,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey,
                              child: Center(
                                child: Text(sky2["username"]
                                    .toString()
                                    .substring(0, 1)),
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
                              backgroundColor: Colors.cyan.shade600,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.grey,
                                child: Center(child: Text(//change
                                        "") //"  ${sky2['username'].toString().substring(0, 1)}"),
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
                                        (sky2 == "" ? "" : sky2['username']))
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
                        )),
              ],
            )),
          );
  }

  @override
  Widget build(BuildContext context) {
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
             extendBodyBehindAppBar:_currentIndex != 4?false:true,
             // _currentIndex != 4?
              appBar: AppBar(
                //extendBodybehindAppBAr:true,
                elevation: 0,
                //leading: SizedBox(),
                //centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor:_currentIndex != 4? Colors.black.withOpacity(0.9):Colors.black.withOpacity(0.1),
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Row(children: [
                  /*Container(
                    //padding: EdgeInsets.only(),
                  height: 40,//MediaQuery.of(context).size.width * 0.13,
                  width: 40,//MediaQuery.of(context).size.width * 0.13,
                  child: Image.asset('assets/icon1.png'),
                ),*/
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
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return chatpage(
                            userid: int.parse(widget.userid),
                            username: sky2['username'],
                            token: widget.token,
                            students: sky3.toList(),
                          );
                        },
                      );
                      //main8();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Icon(Ionicons.chatbubble, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ), //_pageController.animateToPage(2, duration: Duration(milliseconds: 500));

              bottomNavigationBar: //sky3
                  sky2 == "" ? Container() : bN(_currentIndex.toString(), ""),
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
                          Home1(
                            pic_url: pic_url,
                            username: sky2['username'],
                            token: widget.token,
                            //information: information.toString().split(","),
                          ),
                          network(
                            userid: int.parse(widget.userid),
                            username: sky2['username'],
                            token: widget.token,
                          ),
                          work(
                            token: widget.token,
                            userid: int.parse(widget.userid), //widget.userid,
                            username: sky2['username'], //sky2['username'],
                          ),
                          event(
                            token: widget.token,
                            userid: int.parse(widget.userid), //widget.userid,
                            username: sky2['username'],
                          ),
                          profile(
                            token: widget.token,
                            userid: int.parse(widget.userid), //widget.userid,
                            username: sky2['username'],
                          )
                        ]),
              floatingActionButton: _currentIndex != 0 &&
                      _currentIndex != 2 &&
                      _currentIndex != 3
                  ? Container()
                  : FloatingActionButton(
                      backgroundColor: Colors.cyan.shade600,
                      onPressed: () {},
                      tooltip: 'Post',
                      child: _currentIndex != 2 && _currentIndex != 3
                          ? InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      //  sum = 0;
                                      //var given_list = [1, 2, 3, 4, 5];

                                      return Scaffold(
                                        backgroundColor: Colors.grey.shade900,
                                        body: SingleChildScrollView(
                                            child: Column(
                                          children: [
                                            Container(
                                              height: 10,
                                            ),
                                            // ListTile(),
                                            /*
                                                      "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
                                                      */
                                            ListTile(
                                              onTap: () {},
                                              title: Row(children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.all(7),
                                                  //height: 50,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.80,
                                                  child: Container(
                                                    //height:50,
                                                    //color: Colors.blueGrey[900],
                                                    child: TextField(
                                                      keyboardType:
                                                          TextInputType.text,
                                                      autofocus: true,
                                                      maxLines: null,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          //DateFormat('EEEE').format(date);
                                                          this.now = DateFormat(
                                                                  'EEEE d MMM')
                                                              .format(DateTime
                                                                  .now());
                                                          //returns json body from api
                                                          //this.courseblock = result1;
                                                          this.leo = DateFormat
                                                                  .jm()
                                                              .format(DateTime
                                                                  .now());
                                                        });
                                                        enabled:
                                                        false;
                                                      },
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[100]),
                                                      //void man => value.toString();

                                                      decoration:
                                                          InputDecoration(
                                                              // prefixIcon: Icon(Icons.storefront),
                                                              filled: true,
                                                              labelStyle: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      50]),
                                                              fillColor: Colors
                                                                  .grey[900],
                                                              hintText:
                                                                  'Share your Idea',
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      50]),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25.0))),
                                                      controller:
                                                          titleController,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                GestureDetector(
                                                  // Redraw the Stateful Widget

                                                  onTap: () async {
                                                    //talos7.add(titleController.text.toString());
                                                    //talos7.reversed.toList().removeLast();
                                                    /*                litems.add(titleController.text.toString());
                                  _scrollController.animateTo(
                                      _scrollController.position.maxScrollExtent,
                                      duration: Duration(milliseconds: 60),
                                      curve: Curves.fastOutSlowIn);
                                  
                                  if (titleController.text.length > 0) {
                                    Data = await GetData(
                                        'http://192.168.100.20:5000/api?Query=' +
                                            titleController.text.toString());
                                    litems2.add(json.decode(Data));
                                    // Append Text to the list
                                    //ItemScrollController _scrollController = ItemScrollController();
                                    //       _scrollController.jumpTo(pos);

                                    titleController.clear();
                                    // Clear the Text area
                                    setState(() {});
                                    clearText();

                                    sleep(const Duration(milliseconds: 500));

                                    
                                    return litems2;
                                  } else {
                                    try {
                                      if (titleController.text.length > 0) {
                                        litems2.add("Am Offline for the moment");
                                      }
                                    } catch (e) {
                                      titleController.clear();
                                    }

                                    ;
                                  }
                                }*/
                                                  },

                                                  child: CircleAvatar(
                                                    child: Icon(
                                                        Icons.send_outlined),
                                                  ),
                                                  onLongPress: () {},
                                                ),
                                                SizedBox(width: 5),
                                              ]),
                                            ),
                                            ListTile(), ListTile(), ListTile(),
                                            ListTile(
                                                onTap: () {},
                                                tileColor: Colors.black12,
                                                //leading: ,
                                                title: Text(
                                                  "",
                                                ),
                                                subtitle: Text("",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ))),
                                          ],
                                        )),
                                        //bottoma navigation bar
                                      );
                                    });
                              },
                              child: Icon(Icons.create))
                          : _currentIndex != 3
                              ? Icon(Icons.add)
                              : Icon(Icons
                                  .edit_calendar)), // This trailing comma makes auto-formatting nicer for build methods.
            ),
    );
  }
}
