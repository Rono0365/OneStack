import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class avatar1 extends StatefulWidget {
  avatar1({
    Key? key,
    required this.color,
    required this.text,
    required this.textcolor,
  }) : super(key: key);

  final Color color;
  final Color textcolor;
  final String text;

  @override
  State<avatar1> createState() => _avatar1State();
}

class _avatar1State extends State<avatar1> {
  xon(String x) {
    var bn = x.substring(0,1);
    return  bn;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: widget.color,
            child: Center(
                child: Text(
              widget.text.toString().replaceAll(" ","").substring(0,1),
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500, color: widget.textcolor),
            )),
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
