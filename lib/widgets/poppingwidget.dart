import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../posts/popppingpage.dart';

class whp extends StatefulWidget {
  const whp({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.clubpage,
    required this.token,
    required this.username,
    required this.pics,
  }) : super(key: key);
  final String title;
  final String username;
  final String subtitle;
  final List pics;
  final String clubpage;
  final String token;

  @override
  State<whp> createState() => _whpState();
}

class _whpState extends State<whp> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  
                           
                             popping(
                                
                                pic_url: widget.pics,
                                username: widget.username,
                                token: widget.token,
                                clubpage:widget.clubpage, /*"""inversecountString(
                                    int.parse("${io.toString()}"))"""*/
                                
                              ),
                            
                          )),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Ionicons.trending_up_outline,color: Colors.white,),
            title: Text(
              '${widget.title}',
              style: GoogleFonts.roboto(fontSize: 17, color: Colors.white),
            ),
            subtitle: Text(
              '${widget.subtitle} posts',
              style: GoogleFonts.roboto(fontSize: 15, color: Colors.grey),
            ),
            trailing: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PopupMenuButton<String>(
                            color: Colors.grey.shade900,
                            child: Icon(Ionicons.ellipsis_vertical_outline,
                                color: Colors.white),
                            onSelected: (String result) {
                              setState(() {
                                // Handle result from pop-up menu
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              
                              
                              PopupMenuItem<String>(
                                value: 'Not Interested',
                                child: Row(
                                  children: [
                                    Text(
                                      'Not interested',
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
