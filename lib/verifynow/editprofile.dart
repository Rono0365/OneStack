import "dart:convert";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

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
        headers: headers);

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

    //print(verifiedx);
  }

  @override
  void initState() {
    super.initState();
    inmat();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 170,
            child: Text(
              widget.username.toString(),
              style: GoogleFonts.rubik(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
