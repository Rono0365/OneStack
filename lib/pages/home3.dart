import 'package:OneStack/posts/clubpage.dart';
import 'package:OneStack/widgets/timexx.dart';
import 'package:flutter/material.dart';
import 'package:OneStack/widgets/clubcircles.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audioplayers.dart';

import '../widgets/profileheadboardwidget.dart';
import '../widgets/widget1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home3 extends StatefulWidget {
  Home3(
      {Key? key,
      required this.token,
      required this.username,
      required this.information,
      required this.unfo,
      required this.userid,
      required this.pic_url})
      : super(key: key);

  String token;
  String username;
  int userid;
  var pic_url;
  var unfo;
  var information;
  @override
  State<Home3> createState() => _Home3State();
}

//Read through this code
//to master the
// widgets and varibales used
// or else
// utalala  hapa
class _Home3State extends State<Home3> {
  var sky2 = [];
  var pic_url = [];
  //var widgetinformation = [];
  int valv = 7;
  //late ScrollController _controller;
  ScrollController _controller = ScrollController();
  bool _showAppBar = true;
  var zxx = 70;
  final audioCache = AudioCache();
  late FlutterToast flutterToast;
  final List<Color> colors2 = <Color>[
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
  ];
  final List<Color> colors = <Color>[
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100
  ];
  

  slicer(List list) {
    saveList(List myList) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String jsonString = jsonEncode(myList);
      await prefs.setString("key", jsonString);
    }

    getList() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String jsonString = prefs.getString("key");

      final List jsonList = jsonDecode(jsonString);
      return jsonList;
    }

    var g = saveList(list);
    var x11 = getList();
    return list.length == 0 ? [] : x11;
  }

  List<String> utopia(List<String> topics, var verifiedx) {
    List<String> y = [];
    List<String> y1 = [];

    void vortex(String x) {
      verifiedx.forEach((ui) {
        if (ui['username1'] == x.replaceAll(" ", "") &&
            ui["image"] == "realZeus") {
          y.add(x);
        }
      });
    }

    void vortex2(String x) {
      verifiedx.forEach((ui) {
        if (ui['username1'] == x.replaceAll(" ", "") && ui["image"] == "Zeus") {
          y1.add(x);
        }
      });
    }

    topics.forEach((topic) {
      vortex(topic);
      vortex2(topic);
    });
    var k =
        topics.where((item) => !y.contains(item.replaceAll(" ", ""))).toList();
    var xx = k.where((item) => !y1.contains(item.replaceAll(" ", ""))).toList();

    return [...y, ...y1, ...xx];
  }

  retball() {
    flutterToast = FlutterToast(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.black12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(Icons.check),

          /*CircleAvatar(
              radius: 13,
              child: Center(
                child: Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/carrot.png")),
              )),*/ //this was quite unnecessary
          Text("new Posts", style: TextStyle(color: Colors.white))
        ],
      ),
    );

    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 5),
    );
  }

  

  getimage(username) {
    var filteredElements = widget.pic_url
        .where((c) => c['username1'] == username.toString())
        .toList()
        .map((e) => e['image']);
    ////print(filteredElements);
    return filteredElements
        .toString(); //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  getLikesByUsername(elements, String username) {
    var filteredElements = elements.where((x) {
      return x["username"].toString() == username.toString();
    }).toList();

    var likesList =
        filteredElements.map((e) => e['skills'].replaceAll(' ', '')).toList();

    return likesList; //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  var verifiedx = [];
  

  @override
  void initState() {
    //getValidation();
    //getWeather3x();
    

    // print(sky2);
    //inmat2();
    audioCache.load('assets/postsmth.mp3');
    audioCache.load('assets/sendsmth.mp3');
    _controller.addListener(() {
      if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _showAppBar = false;
        });
      } else if (_controller.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _showAppBar = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sugarman = widget.information.reversed
        .where((x) => //get the preffered topics
            // == "IOT"
            getLikesByUsername(sky2, widget.username.toString())
                .reversed
                .first
                .toString()
                .replaceFirst("[", "")
                .replaceFirst("]", "")
                .replaceAll(" ", "")
                .split(",")
                .contains(x["whoiswho"].toString().replaceAll(' ', '')) &&
            x["writer"] == widget.username)
        .toList();
    return  Scaffold(
            backgroundColor: Colors.grey.shade900.withOpacity(0.6),
            //extendBodyBehindAppBar: !_showAppBar,
            appBar: _showAppBar
                ? PreferredSize(
                    preferredSize: Size.fromHeight(150),
                    child: profboard(
                            username: widget.username,
                            userid: widget.userid,
                            token: widget.token,
                            pics: widget.pic_url,
                          )
                        )
                : PreferredSize(
                    preferredSize: Size.fromHeight(150),
                    child: Container(
                      height: 100,
                    )),
            body: Stack(
              children: [
                SizedBox.expand(),
                valv < 1
                    ? //dead code
                    Center(
                        child: Text(
                          "try posting stuff",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      )
                    : SizedBox(
                        height: _showAppBar
                            ? MediaQuery.of(context).size.height * .8
                            : MediaQuery.of(context).size.height,
                         /* RefreshIndicator(
                            onRefresh: () async {
                              //getValidation();
                        
                              //baby come back
                              setState(() {
                                valv = valv * 2;
                              });

                              
                              audioCache.play('postsmth.mp3');

                              // offnd();
                              //Do whatever you want on refrsh.Usually update the date of the listview
                            },
                            sugarman.isEmpty
                                ? Container(
                                    height: 500,
                                    child: Center(
                                      child: Text(
                                        "Posts will appear here",
                                        style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    controller: _controller,
                                    itemCount: sugarman
                                        .length, // Set this to the number of items in your 'widget.information' list
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // Access the current item in the 'widget.information' list

                                      final currentItem = sugarman[index];
                                      if (index == valv &&
                                          valv <= sugarman.length) {
                                        valv = valv + 5;
                                      }
                                      // Create and return a 'homewidget' with the appropriate properties
                                      return homewidget(
                                        time1:
                                            "${currentItem["date"].split("|")[0].split(" ")[1].toString()} "
                                            "${currentItem["date"].split("|")[0].split(" ")[2]}",
                                        time2: currentItem["date"].toString(),
                                        imagez:
                                            currentItem["image"] != "notitle"
                                                ? currentItem["image"]
                                                : "notitle",
                                        imagez1:
                                            currentItem["image1"] != "notitle"
                                                ? currentItem["image1"]
                                                : "notitle",
                                        imagez2:
                                            currentItem["image2"] != "notitle"
                                                ? currentItem["image2"]
                                                : "notitle",
                                        imagez3:
                                            currentItem["image3"] != "notitle"
                                                ? currentItem["image3"]
                                                : "notitle",
                                       
                                        name: currentItem["writer"],
                                        title: currentItem["mation"],
                                        chip:
                                            currentItem["whoiswho"].toString(),
                                        postdata: widget.information
                                            .where((u) =>
                                                u['title']
                                                    .contains('message') &&
                                                u['whoiswho'] ==
                                                    currentItem['id']
                                                        .toString())
                                            .toList(),
                                        peoplex: widget.information
                                            .where((u) =>
                                                u['title']
                                                    .contains('message') &&
                                                u['whoiswho'] ==
                                                    currentItem['id']
                                                        .toString())
                                            .toList(),
                                        people: widget.information
                                            .where((u) =>
                                                u['title']
                                                    .contains('message') &&
                                                u['whoiswho'] ==
                                                    currentItem['id']
                                                        .toString())
                                            .length
                                            .toString(),
                                        Id: currentItem["id"].toString(),
                                        token: widget.token,
                                        myusername: widget.username.toString(),
                                        image: widget.pic_url,
                                        text: '',
                                      );
                                    },
                                  )*/),
              ],
            ),

            /* ...sugarman.map((x) => //get the preffered topics
                                // == "IOT"
                                getLikesByUsername(
                                            sky2, widget.username.toString())
                                        .reversed
                                        .take(1)
                                        .toString()
                                        .replaceFirst("[", "")
                                        .replaceFirst("]", "")
                                        .replaceAll(" ", "")
                                        .split(",")
                                        .contains(x["whoiswho"]
                                            .toString()
                                            .replaceAll(' ', ''))
                                    ? homewidget(
                                        time1:
                                            "${x["date"].split("|")[0].split(" ")[1].toString()} "
                                            "${x["date"].split("|")[0].split(" ")[2]}",
                                        time2: x["date"].toString(),
                                        imagez: x["image"] != "notitle"
                                            ? x["image"]
                                            : "notitle",
                                        name: x["writer"],
                                        title: x["mation"],
                                        chip: x["whoiswho"].toString(),
                                        postdata: widget.information,
                                        peoplex: widget.information
                                                    .map((u) =>
                                                        u['title'].contains(
                                                            'message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .toSet()
                                                    .toList()
                                                    .map((c) {})
                                                    .length ==
                                                1
                                            ? []
                                            : widget.information
                                                .where((u) =>
                                                    u['title']
                                                        .contains('message') &&
                                                    u['whoiswho'] ==
                                                        x['id'].toString())
                                                .toList(),
                                        people: widget.information
                                                    .map((u) =>
                                                        u['title'].contains(
                                                            'message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .toSet()
                                                    .toList()
                                                    .map((c) {})
                                                    .length ==
                                                1
                                            ? ""
                                            : widget.information
                                                .where((u) =>
                                                    u['title']
                                                        .contains('message') &&
                                                    u['whoiswho'] ==
                                                        x['id'].toString())
                                                .length
                                                .toString(),
                                        Id: x["id"].toString(),
                                        token: widget.token,
                                        myusername: widget.username.toString(),
                                        image: widget.pic_url,
                                        text: '',
                                      )
                                    : Container()

                            //.contains(x["whoiswho"])

                            ),
                        ListTile(
                          title: InkWell(
                              onTap: () {
                                setState(() {
                                  zxx * 2;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(sky2.toString()),
                                  Container(
                                      height: 10,
                                      width: 10,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                      )),
                                ],
                              )),
                        ),
                        ListTile(),
                        ListTile(),
                        ListTile()
                      ],
                    ),*/

            //Text(),
            /* Text(widget.information.where((x) =>
                          getLikesByUsername(sky2, widget.username.toString()).toString().replaceFirst("[", "").replaceFirst("]", "").replaceAll(" ", ""))),*/
            //.toList()
            //.map((e) => Text(e.toString()))
          );
  }
}
