import "dart:convert";
import "package:google_fonts/google_fonts.dart";
import "package:http/http.dart" as http;
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class circl extends StatefulWidget {
  circl({
    Key? key,
    required this.username,
    required this.token,
    required this.color,
    required this.textcolor,
    required this.text,
  }) : super(key: key);
  final String username;
  final String token;
  final Color color;
  final Color textcolor;
  final String text;

  @override
  State<circl> createState() => _circlState();
}

class _circlState extends State<circl> {
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
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        width: 75,
        child: Column(children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: widget.color,
                child: Center(
                    child: Text(
                  widget.text.toString().replaceAll(" ", "").substring(0, 1),
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500, color: widget.textcolor),
                )),
              ),
              /* ...verifiedx.map(
            (ui) => ui['username1'] == widget.text.toString().replaceAll(" ", "") &&
                    ui["image"] == "realZeus"
                ? Positioned(
                  right: 2,
                  bottom: 0,
                  child: CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.grey.shade900.withOpacity(0.9),
                      child: Center(
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.black,
                          child: Center(
                              child: Icon(
                            Icons.push_pin,
                            color: Colors.cyan.shade600,
                            size: 10,
                          )),
                        ),
                      ))):SizedBox())
                      ,
                   ...verifiedx.where((ui) => ui['username1'] == widget.text.toString().replaceAll(" ", "")).map(
            (ui) => ui['username1'] == widget.text.toString().replaceAll(" ", "") &&
                    ui["image"] == "Zeus"
                ? Positioned(
                  right: 2,
                  bottom: 0,
                  child: CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.grey.shade900.withOpacity(0.9),
                      child: Center(
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.black,
                          child: Center(
                              child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 10,
                          )),
                        ),
                      ))):SizedBox())*/
            ],
          ),
          Container(height: 4),
          Container(
            width: 75,
            child: Center(
              child: Text(
                "${widget.text.replaceAll(" ", "")}", // Connect Grow
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.normal, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
