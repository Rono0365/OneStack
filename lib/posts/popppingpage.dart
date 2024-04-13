import 'package:OneStack/posts/clubpage.dart';
import 'package:flutter/material.dart';
import 'package:OneStack/widgets/clubcircles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audioplayers.dart';

import '../widgets/widget1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class popping extends StatefulWidget {
  popping(
      {Key? key,
      required this.token,
      required this.username,
      required this.clubpage,
      required this.pic_url})
      : super(key: key);

  String token;
  String username;
  String clubpage;
  List pic_url;

  @override
  State<popping> createState() => _poppingState();
}

class _poppingState extends State<popping> {
  var sky2 = [];
  var pic_url = [];
  var information = [];
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
  }*/

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
    //inm();
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
      pic_url = passed;
      sky2 = passed2;
      information = passed3;
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
      return x["whoiswho"].toString() == username.toString();
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

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return sky2 == ""
        ? Container() //shimer widgets or some animation
        : RefreshIndicator(
                      onRefresh: () async {
                        getValidation();
                        getWeather3x();
                     //   inm();
                        
                        // offnd();
                        //Do whatever you want on refrsh.Usually update the date of the listview
                      },
                      child: Scaffold(
              backgroundColor: Colors.grey.shade900,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(widget.clubpage,style: GoogleFonts.rubik(fontSize: 20),),),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    //newpost(),
                    //
        
                    Container(
                      height: MediaQuery.of(context).size.height * .95,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          getValidation();
                          getWeather3x();
                          //inm();
                          audioCache.play('postsmth.mp3');
        
                          // offnd();
                          //Do whatever you want on refrsh.Usually update the date of the listview
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...information.reversed
                                  .where((e) => e["whoiswho"] == widget.clubpage)
                                  .toList()
                                  .map((x) => //get the preffered topics
                                          // == "IOT"
                                          homewidget(
                                                  postdata: information,
                                                  peoplex: information
                                                              .map((u) =>
                                                                  u['title'].contains(
                                                                      'message') &&
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
                                                              u['title'].contains(
                                                                  'message') &&
                                                              u['whoiswho'] ==
                                                                  x['id']
                                                                      .toString())
                                                          .toList(),
                                                  time1:
                                                      "${x["date"].split("|")[0].split(" ")[1].toString()} "
                                                      "${x["date"].split("|")[0].split(" ")[2]}",
                                                  time2: x["date"]
                                                      .split("|")[1]
                                                      .toString(),
                                                  name: x["writer"],
                                                  imagez: x["image"],
                                                    imagez1: x["image1"],
                                                     imagez2: x["image2"],
                                                      imagez3: x["image3"],
                                                      
                                                  title: x["mation"],
                                                  chip: x["whoiswho"].toString(),
                                                  people: information
                                                              .map((u) =>
                                                                  u['title'].contains(
                                                                      'message') &&
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
                                                              u['title'].contains(
                                                                  'message') &&
                                                              u['whoiswho'] ==
                                                                  x['id']
                                                                      .toString())
                                                          .length
                                                          .toString(),
                                                  Id: x["id"].toString(),
                                                  token: widget.token,
                                                  myusername:
                                                      widget.username.toString(),
                                                  image: widget.pic_url,
                                                  text: '',
                                                )
                                            
                                      //.contains(x["whoiswho"])
        
                                      ),
                              ListTile(),
                              ListTile()
                            ],
                          ),
                        ),
                      ),
                    )
                    //Text(),
                    /* Text(information.where((x) =>
                            getLikesByUsername(sky2, widget.username.toString()).toString().replaceFirst("[", "").replaceFirst("]", "").replaceAll(" ", ""))),*/
                    //.toList()
                    //.map((e) => Text(e.toString()))
                    ,
                    ListTile(),
                    ListTile(),
                  ],
                ),
              ),
            ),
        );
  }
}
