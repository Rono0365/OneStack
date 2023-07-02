import 'package:OneStack/compchat/chatme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:OneStack/widgets/bottomnav.dart';
import 'package:OneStack/widgets/widgets2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class chatpage extends StatefulWidget {
  chatpage({
    Key? key,
    required this.username,
    required this.userid,
    required this.token,
    required this.students,
  }) : super(key: key);

  final String username;
  final int userid;
  final String token;
  final List students;

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  var pic_url;
  var sky3;

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky3', json.encode(sky3));
    //sharedPreferences.setString('information', json.encode(information));
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

    var results = jsonDecode(responsev.body);
    var results2 = jsonDecode(responsev.body);
    setState(() {
      sky3 = results;
      pic_url = picpic;
      //information = infoz;
    });
    inm();
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode(sharedPreferences.getString('pic_url')); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky3'));
    var passed3 = jsonDecode(sharedPreferences.getString('information'));

    setState(() {
      pic_url = passed;
      sky3 = passed2;

      ///information = passed3;
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
    //print(filteredElements);
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
    print("chatpage" +
        likesList //list by chosenuser
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", "")
            .split(",")
            .toString());
    return likesList; //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  String getLocByUsername(elements, String username) {
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
          ].map((e) => e).toSet().toString()
        : filteredElements.reversed.take(1).toList().map((e) =>
            e["location"].toString().replaceAll("[", "").replaceAll("]", ""));
    print("chatpage" +
        likesList //list by chosenuser
            .toString()
            .replaceAll("(", "")
            .replaceAll(")", ""));
    return likesList.toString().replaceAll("(", "").replaceAll(")",
        ""); //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
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
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      color: Colors.black,
      child: 
      
       
      Scaffold(
          extendBody: true,
          backgroundColor: Colors.black.withOpacity(0.9),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.cyan.shade600.withOpacity(0.1),
            elevation: 0,
            title: Text(
              "OneChat", // Connect Grow
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.normal, color: Colors.white),
            ),
            actions:[ InkWell(
          onTap:(){
             Navigator.pop(
        context,
      );
          },
          child: Icon(Icons.close)),SizedBox(width: 10,)],
          ),
          body: communications(
              username: widget.username,
              students: widget.students,
              kala1: true,
              school: "oneStack",
              profpic: pic_url,
              klass: "OneStack",
              tr: widget.token)),
    );
  }
}
