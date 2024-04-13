import 'package:OneStack/newchat/newchat.dart';
import 'package:OneStack/verifynow/verifyservice.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class networkwidget extends StatefulWidget {
  networkwidget({
    Key? key,
    required this.o1,
    required this.o2,
    required this.o3,
    required this.name,
    required this.image,
  }) : super(key: key);
  final String o1;
  final String o2;
  final List o3;
  final List image;
  final String name;

  @override
  State<networkwidget> createState() => _networkwidgetState();
}

class _networkwidgetState extends State<networkwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
        padding: EdgeInsets.only(left: 4.0, right: 4.0),
        child: Card(
          elevation: 0,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Stack(children: [
                      CircleAvatar(
                        radius: 25,
                        // backgroundColor: Colors.cyan.shade600,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.cyan.shade100,
                          child: Center(
                            child: Text(widget.o1.toString().substring(0, 1),style: GoogleFonts.rubik(fontWeight: FontWeight.bold,color: Colors.cyan.shade600,fontSize: 19),),
                          ),
                        ),
                      ),
                      ...widget.image
                          .where((c) => c['username1'] == widget.o1.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 25,
                              //backgroundColor: Colors.cyan.shade600,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(
                                  ui['image'].replaceAll(" ", ""),
                                ),
                              ),
                            ),
                          ),
                    ]),
                  
                    title:verifyme(username:widget.o1.toString(),token:""),
                    
                    
                    trailing: InkWell(
                  onTap: () {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                    ouser: widget.o1.toString(),
                                    pic_url: widget.image,
                                    mUsername: widget.name,
                                  )));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: Icon(Ionicons.chatbubble_ellipses, color: Colors.cyan.shade50),
                    ),
                  ),
                ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          widget.o2.toString(),
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.normal, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
               
                 ListTile(title:Container(
                               //height: 160,
                      //width: MediaQuery.of(context).size.width * 0.9,
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                      runSpacing: 2.0,
                      spacing: 4.0,
                      children: [
                        ...widget.o3
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll("]", "")
                            .replaceAll(" ", "")
                            .split(',')
                            .take(4)
                            .map(
                              (e) => Chip(
                                label: Text(
                                  e.toString(),
                                  style: GoogleFonts.rubik(
                                        //fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        widget.o3
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll("]", "")
                            .replaceAll(" ", "")
                            .split(',').last.length > 4?Chip(
                              backgroundColor: Colors.cyan.shade600.withOpacity(0.5),
                              label:Text("+ ${(widget.o3
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll("]", "")
                            .replaceAll(" ", "")
                            .split(',').last.length-4)}")):SizedBox()
                      ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                    
                
             Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * .95,
                      //color: Colors.grey,
                    ),
                  ],
                ),
          ),
    ));
  }}