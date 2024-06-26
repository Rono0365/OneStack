import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:OneStack/widgets/bottomnav.dart';
import "package:http/http.dart"as http;
import '../widgets/widget3.dart';

class work extends StatefulWidget {
  work({
    Key? key,
    required this.username,
    required this.userid,
    required this.token,
  }) : super(key: key);
  final String username;
  final String token;
  final int userid;

  @override
  State<work> createState() => _workState();
}

class _workState extends State<work> {
  var pic_url;
  var sky5;

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky5', json.encode(sky5));
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
        await http.get(Uri.parse('https://afleet.co.ke/work/'),
            headers: headers);

    var results = jsonDecode(responsev.body);
    var results2 = jsonDecode(responsev.body);
    setState(() {
      this.sky5 = results;
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
    var passed2 = jsonDecode(sharedPreferences.getString('sky5'));
    //var passed3 = jsonDecode(sharedPreferences.getString('events'));

    setState(() {
      pic_url = passed;
      sky5 = passed2;

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
    return  WillPopScope(
      onWillPop: () async {
        // Return true to prevent the user from going back.
        return false;
      },
      child: Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.9),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Work", // Connect Grow
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.normal, color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
               ...sky5.map((i) => 
                 i["skills"].replaceAll("]","").replaceAll("[","").split(",") .any((q1) =>
                                    
                                     getLikesByUsername(sky5, widget.username).toString().replaceAll("]","").replaceAll("[","").split(",").contains(q1))
                                ? workwidget(
                                  workloc: i["location"].toString(),
                                  workowner: i["username"],
                                  workpic: pic_url,
                                  skills:i["skills"].replaceAll("]","").replaceAll("[","").split(","),
                                  worktitle: i["title"].toString(),
                                worksalary: i["salary"].toString()                             ):SizedBox())
                
                ],
            ),
          ),
         
        ),
      ),
    );
  }
}
