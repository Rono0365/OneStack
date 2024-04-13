import "dart:convert";
import "package:google_fonts/google_fonts.dart";
import "package:http/http.dart" as http;
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class verifyme extends StatefulWidget {
  verifyme({
    Key? key,
    required this.username,
    required this.token,
  }) : super(key: key);
  final String username;
  final String token;

  @override
  State<verifyme> createState() => _verifymeState();
}

class _verifymeState extends State<verifyme> {
  var verifiedx = [];
  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed2 = jsonDecode(sharedPreferences.getString('verifiedx'));

    setState(() {
      this.verifiedx = passed2;

      //verifiedx = passed4;
    });
  }

  Future inm() async {
    //inm(sky2,pic_url, information,);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('verifiedx', json.encode(verifiedx));
  }

  inmat() async {
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
    var verified1 = jsonDecode(verified.body); //fixthis
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('verified', json.encode(verified1));
    setState(() {
      this.verifiedx = verified1;
    });
    inm();
    //print(verifiedx);
    //}

    ;
  }

  @override
  void initState() {
    super.initState();
    getValidation();
    inmat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        child: Text(
          widget.username.toString(),
          style: GoogleFonts.lato(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
          // color: Colors.white,

          child: Stack(children: [
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "DONTUSETHIS"
              ? Icon(Icons.verified, size: 13, color: Colors.blue)
              : SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "Zeus"
              ? Icon(Icons.verified, size: 13, color: Colors.blue)
              : SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "Gold"
              ? Center(
                  child: Icon(
                  Icons.verified,
                  size: 15,
                  color: Color(0xFFffd700),
                ))
              : SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "green"
              ? Center(
                  child: Icon(Icons.verified, size: 15, color: Colors.green))
              : SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "BG"
              ? Center(
                  child: Icon(Icons.verified,
                      size: 15, color: Colors.blueGrey.shade900))
              : SizedBox(
                  //ui['image'],
                  ),
        ),
        ...verifiedx.map(
          (ui) => ui['username1'] == widget.username.toString() &&
                  ui["image"] == "realZeus"
              ? Row(children: [
                  Icon(Icons.verified, size: 13, color: Colors.cyan.shade600),
                ])
              : SizedBox(
                  //ui['image'],
                  ),
        ),
      ]))
    ]);
  }
}
