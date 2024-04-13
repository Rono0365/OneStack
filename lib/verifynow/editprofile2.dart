import "dart:convert";
import "package:google_fonts/google_fonts.dart";
import "package:http/http.dart" as http;
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
//Text(widget.ouser,style:GoogleFonts.rubik(color:Colors.white)
                            //),
class vprofile extends StatefulWidget {
  vprofile({
    Key? key,
    required this.username,
    required this.token,
  }) : super(key: key);
  final String username;
  final String token;

  @override
  State<vprofile> createState() => _vprofileState();
}

class _vprofileState extends State<vprofile> {
  var verifiedx = [];
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
    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('verified', json.encode(verified1));
    setState(() {
      verifiedx = verified1;
    });

    //print(verifiedx);
    //}

    ;
  }

  @override
  void initState() {
    super.initState();
    inmat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        Text(
          widget.username.toString(),
          style: GoogleFonts.lato(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
            child: Stack(children: [
          ...verifiedx.map(
            (ui) => ui['username1'] == widget.username.toString() &&
                    ui["image"] == "Zeus"
                ? Center(
                    child: Icon(Icons.verified, size: 15, color: Colors.blue))
                : SizedBox(
                    //ui['image'],
                    ),
          ),
        /*  [Colors.green, "green"],
    [Colors.blueGrey.shade900, "BG"]*/
          ...verifiedx.map(
            (ui) => ui['username1'] == widget.username.toString() &&
                    ui["image"] == "Gold"
                ? Center(
                    child: Icon(Icons.verified, size: 15, color: Color(0xFFffd700),))
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
                    child: Icon(Icons.verified, size: 15, color: Colors.blueGrey.shade900))
                : SizedBox(
                    //ui['image'],
                    ),
          ),
          ...verifiedx.map(
            (ui) => ui['username1'] == widget.username.toString() &&
                    ui["image"] == "realZeus"
                ? Row(children: [
                    Icon(Icons.verified, size: 15, color: Colors.cyan.shade600),
                  ])
                : SizedBox(
                    //ui['image'],
                    ),
          ),
        ]))
      ]),
    );
  }
}
