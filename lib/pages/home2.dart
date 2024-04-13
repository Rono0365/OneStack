//new profile
import 'package:OneStack/pages/home3.dart';
import 'package:OneStack/posts/clubpage.dart';
import 'package:flutter/material.dart';
import 'package:OneStack/widgets/clubcircles.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audioplayers.dart';

import '../widgets/profileheadboardwidget.dart';
import '../widgets/widget1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home2 extends StatefulWidget {
  Home2(
      {Key? key,
      required this.token,
      required this.username,
      required this.userid,
      required this.information,
      required this.unfo,
      required this.pic_url})
      : super(key: key);

  String token;
  String username;
  int userid;
  var pic_url;
  var information;
  var unfo;

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var sky2 = [];
  var pic_url = [];
  var information = [];
  final audioCache = AudioCache();
  final ScrollController _controller = ScrollController();
  bool _showAppBar = true;
  int valv = 7;
  Future inm(List in1, List in2, List in3) async {
    //inm(sky2,pic_url, information,);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('pic_url', json.encode(in2));
    sharedPreferences.setString('sky2x', json.encode(in1));
    sharedPreferences.setString('information', json.encode(in3));
  }

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
    var k = topics.where((item) => !y.contains(item)).toList();
    var xx = k.where((item) => !y1.contains(item)).toList();

    return [...y, ...y1, ...xx];
  }

  /*Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky2', json.encode(sky2));
    sharedPreferences.setString('information', json.encode(information));
  }
*/
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
    http.Response info = await http
        .get(Uri.parse('https://afleet.co.ke/information/'), headers: headers);
    //var results = jsonDecode(responsev.body);
    var infoz = jsonDecode(utf8.decode(info.bodyBytes));
    var results = jsonDecode(responsev.body);
    var results2 = jsonDecode(responsev.body);
    setState(() {
      this.sky2 = results;
      this.pic_url = picpic;
      this.information = infoz;
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
    var passed =
        jsonDecode(sharedPreferences.getString('pic_url')); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky2'));
    var passed3 = jsonDecode(sharedPreferences.getString('information'));

    setState(() {
      this.pic_url = passed;
      this.sky2 = passed2;
      this.information = passed3;
    });
    pic_url == null ? getWeather3x() : "";
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

  List getLikesByUsername(elements, String username) {
    var filteredElements = elements.where((x) {
      return x["username"].toString() == username.toString();
    }).toList();

    var likesList = filteredElements.map((e) => e['skills']).toList();

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
    final verified = await http.get(
      Uri.parse('https://afleet.co.ke/verified/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //info3
    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    var seen1 = jsonDecode(utf8.decode(info2.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('verified', json.encode(verified1));
    setState(() {
      verifiedx = verified1;
      information = seen1;
    });

    //print(verifiedx);
    //}

    ;
  }

  @override
  void initState() {
    getValidation();
    getWeather3x();
    //inm();
    inmat2();
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
    return sky2 == ""
        ? Container() //shimer widgets or some animation
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                //newpost(),
                //
                _showAppBar
                    ? profboard(
                        username: widget.username,
                        userid: widget.userid,
                        token: widget.token,
                        pics: widget.pic_url,
                      )
                    : Container(
                        height: 100,
                      ),

                Home3(
                  token: widget.token,
                  userid: widget.userid,
                  username: widget.username,
                  pic_url: widget.pic_url,
                  unfo: widget.unfo,
                  information: widget.information,
                ),

                ListTile(),
                ListTile(), ListTile(),
                ListTile()
                /*SizedBox(
                    height: _showAppBar?MediaQuery.of(context).size.height*.8:MediaQuery.of(context).size.height ,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        getValidation();
                        getWeather3x();
                        //inm();
                        audioCache.play('postsmth.mp3');

                        // offnd();
                        //Do whatever you want on refrsh.Usually update the date of the listview
                      },
                      child: ListView(
                        controller: _controller,
                   
                          children: [
                            /* required this.username,
    required this.userid,
    required this.token,
    required this.pics,*/
                            
                            ...information.reversed.where((e) =>e["writer"]==widget.username).toList().map(
                                (x) => //get the preffered topics
                                    // == "IOT"
                                    getLikesByUsername(sky2, widget.username.toString())
                                            .reversed
                                            .take(1)
                                            .toString()
                                            .replaceFirst("[", "")
                                            .replaceFirst("]", "")
                                            .replaceAll(" ", "")
                                            .split(",")
                                            .contains(x["whoiswho"])
                                        ? homewidget(
                                           postdata: information,
                                       peoplex: information
                                                        .map((u) =>
                                                            u['title'].contains('message') &&
                                                            u['whoiswho'] ==
                                                                x['id']
                                                                    .toString())
                                                        .toSet()
                                                        .toList()
                                                        .map((c) {})
                                                        .length ==
                                                    1
                                                ? []
                                                : information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString()).toList()
                                                    ,   
                                            time1:
                                                "${x["date"].split("|")[0].split(" ")[1].toString()} "
                                                "${x["date"].split("|")[0].split(" ")[2]}",
                                            time2: x["date"]
                                                .split("|")[1]
                                                .toString(),
                                                imagez: x["image"],
                                            name: x["writer"],
                                            title: x["mation"],
                                            chip: x["whoiswho"].toString(),
                                            
                                            people: information
                                                        .map((u) =>
                                                            u['title'].contains('message') &&
                                                            u['whoiswho'] ==
                                                                x['id']
                                                                    .toString())
                                                        .toSet()
                                                        .toList()
                                                        .map((c) {})
                                                        .length ==
                                                    1
                                                ? ""
                                                : information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .length
                                                    .toString(),
                                            Id: x["id"].toString(),
                                            token: widget.token,
                                            myusername: widget.username.toString(),
                                            image: widget.pic_url, text: '',)
                                        : Container()

                                //.contains(x["whoiswho"])

                                ),
                            ListTile(),
                            ListTile()
                          ],
                        
                      ),
                    ),
                  )*/
                //Text(),
                /* Text(information.where((x) =>
                          getLikesByUsername(sky2, widget.username.toString()).toString().replaceFirst("[", "").replaceFirst("]", "").replaceAll(" ", ""))),*/
                //.toList()
                //.map((e) => Text(e.toString()))
              ],
            ),
          );
  }
}
