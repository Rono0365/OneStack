import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:OneStack/pages/events.dart';
import 'package:OneStack/pages/network.dart';
import 'package:OneStack/pages/profile.dart';
import 'package:OneStack/widgets/widget3.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main.dart';
import '../pages/work.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

//mport 'package:phosphor_flutter/phosphor_flutter.dart';

class bottomW extends StatefulWidget {
  bottomW(
      {Key? key,
      required this.pressed,
      required this.username,
      required this.userid,
      required this.token})
      : super(key: key);
  final String pressed;
  final String username;
  final String token;
  final int userid;

  @override
  State<bottomW> createState() => _bottomWState();
}

class _bottomWState extends State<bottomW> {
  var pressed = 'Home';
  var pic_url;
  var sky3;
  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky3', json.encode(sky3));
    //sharedPreferences.setString('passed', "passed");
  }

  Future getWeather3x() async {
    String token = widget.token.toString();

    //print('here' + token);
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
      sky3 = results;
      pic_url = picpic;
    });
    inm();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode(sharedPreferences.getString('pic_url')); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky3'));

    setState(() {
      pic_url = passed;
      sky3 = passed2;
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
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black.withOpacity(.9),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                pressed = "Home";
              });
              inm();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            userid: widget.userid.toString(),
                            token: widget.token,
                            title: "Wave",
                          )));
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor:
                  Colors.transparent, //no outlineColors.cyan.shade600
              child: Icon(
                  widget.pressed == "Home"
                      ? EvaIcons.home
                      : EvaIcons.homeOutline,
                  color: widget.pressed == "Home"
                      ? Colors.cyan.shade600
                      : Colors
                          .white), //Icon(Ionicons.home_outline,color: Colors.cyan.shade600,),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                pressed = "Network";
              });
              inm();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => network(
                            userid: widget.userid,
                            username: widget.username,
                            token: widget.token,
                          )));
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: Icon(
                  widget.pressed == "Network"
                      ? Icons.groups
                      : Icons.groups_outlined,
                  color: widget.pressed == "Network"
                      ? Colors.cyan.shade600
                      : Colors.white),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                pressed = "Work";
              });
              inm();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => work(
                            token: widget.token,
                            userid: widget.userid,
                            username: widget.username,
                          )));
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: Icon(
                  widget.pressed == "Work"
                      ? Ionicons.briefcase
                      : Ionicons.briefcase_outline,
                  color: widget.pressed == "Work"
                      ? Colors.cyan.shade600
                      : Colors.white),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                pressed = "Event";
              });
              inm();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => event(
                            token: widget.token,
                            userid: widget.userid,
                            username: widget.username,
                          )));
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: Icon(
                Ionicons.calendar_outline,
                color: widget.pressed == "Event"
                    ? Colors.cyan.shade600
                    : Colors.white,
              ),
            ),
          ),
          widget.pressed == "profile"
              ? Container(
                  child: Stack(children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.cyan.shade600,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                        child: Center(
                          child:
                              Text(widget.username.toString().substring(0, 1)),
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
                                c['username1'] == widget.username.toString())
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
                                c['username1'] == widget.username.toString())
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
                      pressed = "profile";
                    });
                    inm();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => profile(
                                  token: widget.token,
                                  userid: widget.userid,
                                  username: widget.username,
                                )));
                  },
                  child: Container(
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.cyan.shade600,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                          child: Center(
                            child: Text(
                                widget.username.toString().substring(0, 1)),
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
                                  c['username1'] == widget.username.toString())
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
                              .where((c) => c['username1'] == widget.username)
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
}
