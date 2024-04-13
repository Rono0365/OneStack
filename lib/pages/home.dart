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

import '../widgets/widget1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home1 extends StatefulWidget {
  Home1(
      {Key? key,
      required this.token,
      required this.username,
      required this.information,
      required this.pic_url})
      : super(key: key);

  String token;
  String username;
  var information;
  var pic_url;

  @override
  State<Home1> createState() => _Home1State();
}

//Read through this code
//to master the
// widgets and varibales used
// or else
// utalala  hapa
class _Home1State extends State<Home1> {
  var sky2 = [];
  var pic_url = [];
  var information = [];
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
  Future inm(List in1, List in2, List in3) async {
    //inm(sky2,pic_url, information,);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('pic_url', json.encode(in2));
    sharedPreferences.setString('sky2x', json.encode(in1));
    sharedPreferences.setString('information', json.encode(in3));
  }

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
    http.Response responsev = //http://172.16.12.17:8000/
        await http.get(Uri.parse('https://afleet.co.ke/unfo/'),
            headers: headers);
    http.Response info = await http
        .get(Uri.parse('https://afleet.co.ke/information/'), headers: headers);
    //var results = jsonDecode(responsev.body);
    List<dynamic> infoz = jsonDecode(utf8.decode(info.bodyBytes));
    List<dynamic> picpic = jsonDecode(picpic1.body);
    var results = jsonDecode(responsev.body);
    //var results2 = jsonDecode(responsev.body);
    setState(() {
      //i removed .this
      this.sky2 = results;
      this.pic_url = picpic;
      this.information = infoz;
      inm(
        sky2,
        pic_url,
        information,
      );
    });
    inm(
      sky2,
      pic_url,
      information,
    );
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

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed2 = jsonDecode(sharedPreferences.getString('sky2x'));
    var passed3 = jsonDecode(sharedPreferences.getString('information'));
    //var passed4 = jsonDecode(sharedPreferences.getString('verified1'));
    List<dynamic> passed =
        jsonDecode(sharedPreferences.getString('pic_url')); //alredy passed here

    setState(() {
      this.information = passed3;
      this.sky2 = passed2;
      this.pic_url = passed;

      //verifiedx = passed4;
    });
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
  inmat2() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    final info2 = await http.get(Uri.parse('https://afleet.co.ke/information/'),
        headers:
            headers); //utf8.decode(responsev.bodyBytes) brings out the emoji
    final xx = await http.get(Uri.parse('https://afleet.co.ke/unfo/'),
        headers: headers);
    final verified = await http.get(
      Uri.parse('https://afleet.co.ke/verified/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //info3
    List<dynamic> verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    List<dynamic> seen1 = jsonDecode(utf8.decode(info2.bodyBytes));
    List<dynamic> xx1 = jsonDecode(utf8.decode(xx.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    setState(() {
      this.verifiedx = verified1;
      this.information = seen1;
      this.sky2 = xx1;
    });

    sharedPreferences.setString('verified', json.encode(verified1));
    sharedPreferences.setString('information', json.encode(information));
    sharedPreferences.setString('sky2x', json.encode(sky2));
    //print(verifiedx);
    //}

    ;
  }

  @override
  void initState() {
    getWeather3x();
    getValidation();

    inm(
      sky2,
      pic_url,
      information,
    );

    // print(sky2);
    //inmat2();
    audioCache.load('assets/postsmth.mp3');
    audioCache.load('assets/sendsmth.mp3');
    /*_controller.addListener(() {
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
    });*/
    super.initState();
  }

  @override
  void dispose() {
    inm(
      sky2,
      pic_url,
      information,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sugarman = information.reversed
        .where((x) => //get the preffered topics
            // == "IOT"
            getLikesByUsername(sky2, widget.username.toString())
                .reversed
                .take(1)
                .toString()
                .replaceFirst("[", "")
                .replaceFirst("]", "")
                .replaceAll(" ", "")
                .split(",")
                .contains(x["whoiswho"].toString().replaceAll(' ', '')))
        .toList();
    return information.isEmpty
        ? Container(
            color: Colors.black,
            child: Center(child: const CircularProgressIndicator()),
          ) //shimer widgets or some animation
        : Scaffold(
            backgroundColor: Colors.black.withOpacity(0.9),
            body:

                /* _showAppBar
                    ? SizedBox(
                        height: 107,
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ...sky2
                                    .where((x) =>
                                        x["username"].toString() ==
                                        widget.username.toString())
                                    .toList()
                                    .reversed
                                    .take(1)
                                    .map((e) => SizedBox(
                                            child: Row(children: [
                                          ...utopia(
                                                  e['skills']
                                                      .replaceAll("[", "")
                                                      .replaceAll("]", "")
                                                      .split(','),
                                                  verifiedx)
                                              .map((op) => InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          context: context,
                                                          builder: (context) {
                                                            //  sum = 0;
                                                            //var given_list = [1, 2, 3, 4, 5];

                                                            return clubZ(
                                                              sky3: sky2,
                                                              kala: colors[e[
                                                                      'skills']
                                                                  .replaceAll(
                                                                      "[", "")
                                                                  .replaceAll(
                                                                      "]", "")
                                                                  .split(',')
                                                                  .indexOf(op)],
                                                              pics: pic_url,
                                                              username: widget
                                                                  .username,
                                                              token: widget
                                                                  .username,
                                                              title: op,
                                                              information:
                                                                  information
                                                                      .reversed
                                                                      .toList(),
                                                            );
                                                          });
                                                    },
                                                    child: avatar1(
                                                      username: widget.username,
                                                      token: widget.token,
                                                      color: colors[e['skills']
                                                          .replaceAll("[", "")
                                                          .replaceAll("]", "")
                                                          .split(',')
                                                          .indexOf(op)],
                                                      textcolor: colors2[e[
                                                              'skills']
                                                          .replaceAll("[", "")
                                                          .replaceAll("]", "")
                                                          .split(',')
                                                          .indexOf(op)],
                                                      text: op,
                                                    ),
                                                  )),
                                        ])))
                              ],
                            ),
                          ),
                        ))
                    : const SizedBox(),*/
                Container(
                    height:
                        /* _showAppBar
                      ? MediaQuery.of(context).size.height * .8
                      :*/
                        MediaQuery.of(context).size.height,
                        color: Colors.grey.shade900,
                    child: RefreshIndicator(
                        onRefresh: () async {
                          //getValidation();
                         // getWeather3x();
                          //baby come back
                          setState(() {
                            valv = valv * 2;
                          });

                          inm(
                            sky2,
                            pic_url,
                            information,
                          );
                          audioCache.play('postsmth.mp3');

                          // offnd();
                          //Do whatever you want on refrsh.Usually update the date of the listview
                        },
                        child: ListView.builder(
                          controller: _controller,
                          itemCount:
                            valv                              , // Set this to the number of items in your 'information' list
                          itemBuilder: (BuildContext context, int index) {
                            // Access the current item in the 'information' list

                            final currentItem = sugarman[index];
                            if (index >= valv - 1) {
                              valv = valv + 5;
                            }
                            // Create and return a 'homewidget' with the appropriate properties
                            return homewidget(
                              time1:
                                  "${currentItem["date"].split("|")[0].split(" ")[1].toString()} "
                                  "${currentItem["date"].split("|")[0].split(" ")[2]}",
                              time2: currentItem["date"].toString(),
                              imagez: currentItem["image"] != "notitle"
                                  ? currentItem["image"]
                                  : "notitle",
                              imagez1: currentItem["image1"] != "notitle"
                                  ? currentItem["image1"]
                                  : "notitle",
                              imagez2: currentItem["image2"] != "notitle"
                                  ? currentItem["image2"]
                                  : "notitle",
                              imagez3: currentItem["image3"] != "notitle"
                                  ? currentItem["image3"]
                                  : "notitle",
                             
                              name: currentItem["writer"],
                              title: currentItem["mation"],
                              chip: currentItem["whoiswho"].toString(),
                              postdata: information
                                  .where((u) =>
                                      u['title'].contains('message') &&
                                      u['whoiswho'] ==
                                          currentItem['id'].toString())
                                  .toList(),
                              peoplex: information
                                  .where((u) =>
                                      u['title'].contains('message') &&
                                      u['whoiswho'] ==
                                          currentItem['id'].toString())
                                  .toList(),
                              people: information
                                  .where((u) =>
                                      u['title'].contains('message') &&
                                      u['whoiswho'] ==
                                          currentItem['id'].toString())
                                  .length
                                  .toString(),
                              Id: currentItem["id"].toString(),
                              token: widget.token,
                              myusername: widget.username.toString(),
                              image: widget.pic_url,
                              text: '',
                            );
                          },
                        ))),

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
                                        postdata: information,
                                        peoplex: information
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
                                            : information
                                                .where((u) =>
                                                    u['title']
                                                        .contains('message') &&
                                                    u['whoiswho'] ==
                                                        x['id'].toString())
                                                .toList(),
                                        people: information
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
                                            : information
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
            /* Text(information.where((x) =>
                          getLikesByUsername(sky2, widget.username.toString()).toString().replaceFirst("[", "").replaceFirst("]", "").replaceAll(" ", ""))),*/
            //.toList()
            //.map((e) => Text(e.toString()))
          );
  }
}
