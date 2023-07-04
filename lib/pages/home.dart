import 'package:flutter/material.dart';
import 'package:OneStack/widgets/clubcircles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/widget1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home1 extends StatefulWidget {
  Home1(
      {Key? key,
      required this.token,
      required this.username,
      required this.pic_url})
      : super(key: key);

  String token;
  String username;
  var pic_url;

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  var sky2;
  var pic_url;
  var information;

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
  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky2', json.encode(sky2));
    sharedPreferences.setString('information', json.encode(information));
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
    inm();
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
    //print(filteredElements);
    return filteredElements
        .toString(); //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  List getLikesByUsername(elements, String username) {
    var filteredElements = elements.where((x) {
      return x["username"].toString() == username.toString();
    }).toList();

    var likesList = filteredElements.map((e) => e['skills']).toList();
    print("home" +
        likesList
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", "")
            .split(",")
            .toString());
    return likesList; //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
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
    return sky2 == ""
        ? Container() //shimer widgets or some animation
        : Scaffold(
            backgroundColor: Colors.black.withOpacity(0.9),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //newpost(),
                  //
                  Container(
                      height: 100,
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
                                  .toList().reversed
                                 .take(1)
                                  
                                  .map((e) => Container(
                                          child: Row(children: [
                                        ...e['skills']
                                            .replaceAll("[", "")
                                            .replaceAll("]", "")
                                            .split(',')
                                            .map((op) => avatar1(
                                                  color: colors[e['skills']
                                                      .replaceAll("[", "")
                                                      .replaceAll("]", "")
                                                      .split(',')
                                                      .indexOf(op)],
                                                  textcolor: colors2[e['skills']
                                                      .replaceAll("[", "")
                                                      .replaceAll("]", "")
                                                      .split(',')
                                                      .indexOf(op)],
                                                  text: op,
                                                )),
                                      ])))
                            ],
                          ),
                        ),
                      )),

                  //Text(),
                  /* Text(information.where((x) =>
                          getLikesByUsername(sky2, widget.username.toString()).toString().replaceFirst("[", "").replaceFirst("]", "").replaceAll(" ", ""))),*/
                  ...information.toList().map((x) => //get the preffered topics
                          // == "IOT"
                          getLikesByUsername(sky2, widget.username.toString()).reversed.take(1)
                                  .toString()
                                  .replaceFirst("[", "")
                                  .replaceFirst("]", "")
                                  .replaceAll(" ", "")
                                  .split(",")
                                  .contains(x["whoiswho"])
                              ? homewidget(
                                  time1:
                                      "${x["date"].split("|")[0].split(" ")[1].toString()} "
                                      "${x["date"].split("|")[0].split(" ")[2]}",
                                  time2: x["date"].split("|")[1].toString(),
                                  name: x["writer"],
                                  title: x["mation"],
                                  chip: x["whoiswho"].toString(),
                                  people: 
                                                                information.map((u) => u['title'].contains('message') && u['whoiswho'] == x['id'].toString()).toSet().toList().map((c) {}).length ==
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
                                  
                                  image: widget.pic_url)
                              : Container()

                      //.contains(x["whoiswho"])

                      ) //.toList()
                  //.map((e) => Text(e.toString()))
                  ,
                  ListTile(),
                  ListTile(),
                ],
              ),
            ),
          );
  }
}
