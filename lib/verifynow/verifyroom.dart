import "dart:convert";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

class verifyroom extends StatefulWidget {
  verifyroom({
    Key? key,
    required this.username,
    required this.token,
  }) : super(key: key);
  final String username;
  final String token;

  @override
  State<verifyroom> createState() => _verifyroomState();
}

class _verifyroomState extends State<verifyroom> {
  var verifiedx = [];
  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed4 = jsonDecode(sharedPreferences.getString('verifiedx'));

    setState(() {
      verifiedx = passed4;
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

    final verified = await http.get(
      Uri.parse('https://afleet.co.ke/verified/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('verified', json.encode(verified1));

    setState(() {
      verifiedx = verified1;
    });
    inm();
    //print(verifiedx);
  }

  @override
  void initState() {
    super.initState();
    getValidation();
    //inmat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Expanded(
            child: Row(
              children: [
                Container(
                  width: 170,
                  child: Text(
                    widget.username.toString(),
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
