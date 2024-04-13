import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:OneStack/widgets/bottomnav.dart';
import 'package:ionicons/ionicons.dart';
import '../compchat/search.dart';
import '../explore/newserach.dart';
import '../explore/rocket.dart';
import '../widgets/widget3.dart';
import '../widgets/widget4.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class event extends StatefulWidget {
  event({
    Key? key,
    required this.username,
    required this.userid,
    required this.token,
    required this.sky2,
    required this.pics,
  }) : super(key: key);
  final String username;
  final String token;
  final int userid;
  final List sky2;
  final List pics;

  @override
  State<event> createState() => _eventState();
}

class _eventState extends State<event> {
  var pic_url = [];
  var sky1 = [];
  final titleController = TextEditingController();

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky1', json.encode(sky1));
    //sharedPreferences.setString('events', json.encode(events));
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
        await http.get(Uri.parse('https://afleet.co.ke/event/'),
            headers: headers);

    var results = jsonDecode(responsev.body);
    var results2 = jsonDecode(responsev.body);
    setState(() {
      this.sky1 = results;
      pic_url = picpic;
      //events = infoz;
    });
    inm();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode(sharedPreferences.getString('pic_url')); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky1'));
    //var passed3 = jsonDecode(sharedPreferences.getString('events'));

    setState(() {
      pic_url = passed;
      sky1 = passed2;

      ///events = passed3;
    });
    pic_url == null ? getWeather3x() : "";
  }

  getimage(username) {
    var filteredElements = pic_url.length == 0
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
        : pic_url
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

    var likesList = filteredElements.length == 0
        ? [
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            },
            {
              "id": 1,
              "username": "admin",
              "likes":
                  "[Django, Flutter, Rust, cooking, Ruby, PHP, Go, Laravel]",
              "location": "h",
              "skills":
                  "[Deployment, Front-end development, Testing, JavaScript, Java, Swift, Python, Version control, Databases, Back-end development, Kiswahili, C++, Security, C#, Ruby, cooking, R, Rust, Flutter, Django]"
            }
          ].map((e) => e['skills']).toList()
        : filteredElements.map((e) => e['skills']).toList();

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
    return WillPopScope(
      onWillPop: () async {
        // Return true to prevent the user from going back.
        return false;
      },
      child: Container(
        color: Colors.white,
        child: Scaffold(
            backgroundColor: Colors.black.withOpacity(0.9),
            body: Stack(
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
                                  height: MediaQuery.of(context).size.height,
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
                                  "https://media.istockphoto.com/id/1495565339/photo/silhoute.webp?b=1&s=170667a&w=0&k=20&c=DoqbZfNNrNKF7AI3Mz80177GzzXIwwD4xS425c33Qp4=",
                                  fit: BoxFit.cover,
                                )),
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
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

                //here

                RefreshIndicator(
                  onRefresh: () async {
                    getValidation();
                    getWeather3x();
                    inm();

                    // offnd();
                    //Do whatever you want on refrsh.Usually update the date of the listview
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Card(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  ListTile(),
                                  ListTile(),
                                  Center(
                                    child: InkWell(
                                      
                                      child: SizedBox(
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15.0,
                                                  bottom: 0),
                                              //padding: EdgeInsets.symmetric(horizontal: 15),
                                              child: TextField(
                                                enabled: false,
                                       
                                                controller: titleController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  /* suffixIcon: const Icon(
                                      Ionicons.funnel_outline,
                                      color: Colors.white,
                                    ),*/
                                    
                                                  enabled: false,
                                                  filled: true,
                                                  fillColor: Colors.grey[900],
                                                  //fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),

                                                  //border: OutlineInputBorder(),
                                                  //labelText: 'Password',
                                                  hintText: 'Search events ...',
                                                  hintStyle:
                                                      TextStyle(color: Colors.grey),
                                                ),
                                                style: GoogleFonts.roboto(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return searchQ(
                                                misearch: sky1,
                                                username: widget.username,
                                                profpic: pic_url,
                                                token: widget.token,
                                              
                                              );
                                            });
                                      },
                                              child: SizedBox(
                                                                                    height: 60,
                                                                                    width:
                                              MediaQuery.of(context).size.width,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 17.0,
                                            top: 15.0,
                                            bottom: 15.0),
                                        child: Text(
                                          "what's popping",
                                          style: GoogleFonts.rubik(
                                              fontSize: 19,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .8,
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          rocket(
                                              username: widget.username,
                                              token: widget.token,
                                              sky2: widget.sky2,
                                              pics: widget.pics),
                                          Divider(),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 17.0,
                                                    top: 15.0,
                                                    bottom: 15.0),
                                                child: Text(
                                                  "Latest Events",
                                                  style: GoogleFonts.rubik(
                                                      fontSize: 19,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                          ...sky1.reversed.map((i) => i[
                                                      "skills"]
                                                  .replaceAll("]", "")
                                                  .replaceAll("[", "")
                                                  .split(",")
                                                  .any((q1) =>
                                                      getLikesByUsername(sky1,
                                                              widget.username)
                                                          .toString()
                                                          .replaceAll("]", "")
                                                          .replaceAll("[", "")
                                                          .split(",")
                                                          .contains(q1))
                                              ? eventwidget(
                                                  eventdate: DateTime.parse(
                                                      "${i["date"]}"),
                                                  eventowner:
                                                      "${i["username"]}",
                                                  eventloc: "${i["location"]}",
                                                  numb: sky1.indexOf(i),
                                                  eventpic:
                                                      pic_url, //get  username id
                                                  eventtitle: "${i["title"]}",
                                                )
                                              : SizedBox(
                                                  child:
                                                      null //Text("${ i["skills"].replaceAll("]","").replaceAll("[","").split(",")}${getLikesByUsername(sky1, widget.username).toString().replaceAll("]","").replaceAll("[","").split(",")}")
                                                  )),
                                        ]),
                                      )),
                                  ListTile(),
                                  ListTile()
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
