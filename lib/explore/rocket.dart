import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";
import "../posts/clubpage.dart";
import "../posts/popppingpage.dart";
import "../widgets/poppingwidget.dart";

//fvk i hve to remove the prints it's not good for prod
class rocket extends StatefulWidget {
  const rocket(
      {Key? key,
      required this.token,
      required this.sky2,
      required this.username,
      required this.pics})
      : super(key: key);
  final String token;
  final List sky2;
  final List pics;
  final String username;
  @override
  State<rocket> createState() => _rocketState();
}

class _rocketState extends State<rocket> {
  //here
  var information = [];
  Future inm() async {
    //inm(sky2,pic_url, information,);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('information', json.encode(information));
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed4 = jsonDecode(sharedPreferences.getString('information'));

    setState(() {
      information = passed4;
    });
  }

  Future getWeather3x() async {
    String token = widget.token.toString();

    //print('here' + token);
    ////print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };

    http.Response info = await http
        .get(Uri.parse('https://afleet.co.ke/information/'), headers: headers);
    //var results = jsonDecode(responsev.body);
    var infoz = jsonDecode(utf8.decode(info.bodyBytes));

    setState(() {
      this.information = infoz;
    });
    inm();
  }

  fu(var hh) {
    bool isStringWithoutNumbers(String input) {
      return RegExp(r'^[a-zA-Z]+$').hasMatch(input);
    }

    /*
    {"id":344,"to":"334","whoiswho":"334","writer":"freshfit01","mation":"the king os here","image":"notitle","title":"message","date":"Saturday 12 Aug|11:47 PM|freshfit01"}
      */
    var groupedMapx = [];
    var hhh = hh
        .where((o) =>
            isStringWithoutNumbers(o["whoiswho"]) &&
            o["whoiswho"] != "RetRono" &&
            o["whoiswho"] != "RetrowRetrow")
        .map((p) => groupedMapx.add(p["whoiswho"]));
    print(
        hhh); //if yoou remove this it won't work because hhh needs to be called if youdo find a way to call it inorder for it to work
    var jugger =
        groupedMapx.toSet().map((e) => countStringOccurrences(e)).toList();
    jugger.sort((a, b) => b.compareTo(a));
    return jugger.toSet();
  }

  countStringOccurrences(String targetString) {
    var count = information.where((e) => e["whoiswho"] == targetString).length;
    return count;
  }

  inversecountString(int targetString) {
    var newstuff = "";
    bool isStringWithoutNumbers(String input) {
      return RegExp(r'^[a-zA-Z]+$').hasMatch(input);
    }

    var groupedMapx = [];
    var hhh = information
        .where((o) => isStringWithoutNumbers(o["whoiswho"]))
        .map((p) => groupedMapx.add(p["whoiswho"]));
    print(hhh);
    var hello = groupedMapx.map((x) {
      targetString == countStringOccurrences(x)
          ? setState(() {
              newstuff = x;
            })
          : "";
      print(newstuff);
    });
    print(hello);
    return newstuff;
  }

  @override
  void initState() {
    getValidation();
    getWeather3x();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        children: [
          ...fu(information)
              .map((io) => InkWell(
                    child: whp(
                      username: widget.username,
                      token: widget.token,
                      pics: widget.pics,
                      clubpage:
                          inversecountString(int.parse("${io.toString()}")),
                      title: inversecountString(int.parse("${io.toString()}")),
                      subtitle: countStringOccurrences(
                              inversecountString(int.parse("${io.toString()}")))
                          .toString(),
                    ),
                  ))
              .take(6)
        ],
      ),
    );
  }
}
