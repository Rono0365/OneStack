import 'package:OneStack/compchat/comments.dart';
import 'package:OneStack/verifynow/verifyservice.dart';
import 'package:OneStack/widgets/linkdetector.dart';
import 'package:OneStack/widgets/replywidget.dart';
import 'package:OneStack/widgets/timexx.dart';
import 'package:OneStack/widgets/usercircles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../posts/replypost.dart';

class clubwidget extends StatefulWidget {
  clubwidget(
      {Key? key,
      required this.name,
      //required this.indexprimo,
      required this.title,
      required this.Id,
      required this.chip,
      required this.token,
      required this.people,
      required this.peoplex,
      required this.postdata,
      required this.image,
      required this.text,
      required this.time1,
      required this.myusername,
      required this.time2})
      : super(key: key);

  final String name;
  //final int indexprimo;
  final String myusername;
  final List postdata;
  final List peoplex;
  final String title;
  final String chip;
  final String people;
  final String Id;
  final String token;
  final List image;
  final String time1;
  final String time2;
  final String text;

  @override
  State<clubwidget> createState() => _clubwidgetState();
}

class _clubwidgetState extends State<clubwidget> {
  @override
  Widget build(BuildContext context) {
    var otheruser= "exampluser";
    mrbluesky(
      String Xx,
      String name1,
      int id1,
      String title1,
      List image1,
      String time1,
      String token1,
      String ouser1,
    ) {
      return Xx.toString().substring(0, 1) == '[' && Xx.split(',').length > 1
          ? Xx.split(',')[3].toString().replaceAll("]","")
          : Xx;
    }

    replyget(
      String Xx,
      String name1,
      int id1,
      String title1,
      List image1,
      String time1,
      String token1,
      String ouser1,
    ) {
      return Xx.toString().substring(0, 1) == '[' && Xx.split(',').length > 1
          ?
          
          replywidget(
              //postdata: widget.postdata,
              name: name1,
              id: id1,
              title: title1,
              token: token1,
              image: image1,
              time:  Xx.split(',')[2].toString().replaceAll("]","").replaceAll("@",""),
              ouser: Xx.split(',')[1].toString().replaceAll("]","").replaceAll(" ",""),
              text: Xx.split(',')[0].toString())
          : SizedBox();
    }

    var container = Container(
      child: Stack(children: [
        CircleAvatar(
          radius: 12,
          // backgroundColor: Colors.cyan.shade600,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey,
            child: Center(
              child: Text(widget.name.toString().substring(0, 1)),
            ),
          ),
        ),
        ...widget.image
            .where((c) => c['username1'] == widget.name.toString())
            .map(
              (ui) => CircleAvatar(
                radius: 12,
                //backgroundColor: Colors.cyan.shade600,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.transparent,

                  backgroundImage: NetworkImage(
                    ui['image'].replaceAll(" ", ''),
                  ), //ui['image'],
                ),
              ),
            ),
      ]),
    );
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FriendMess3(
                      pics: widget.image,
                      name: widget.myusername,
                      text:widget.title,
                      image: "",
                      id: widget.Id,
                      ouser:widget.name,
                      time:widget.time1,
                      title: widget.Id, //id of the chat

                      token: widget.token, //randombla
                      myname: "onestack", //class teacher
                      user: widget.myusername, //class
                    )));
      },
      child: Container(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          //padding: EdgeInsets.all(8.0),
          child: Card(
            elevation: 0,
            color: Colors.black.withOpacity(0.8),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 22,
                        // backgroundColor: Colors.cyan.shade600,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.grey,
                          child: Center(
                            child: Text(widget.name.toString().substring(0, 1)),
                          ),
                        ),
                      ),
                      ...widget.image
                          .where(
                              (c) => c['username1'] == widget.name.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.transparent,
                              //backgroundColor: Colors.cyan.shade600,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.transparent,

                                backgroundImage: NetworkImage(
                                  ui['image'].replaceAll(" ", ''),
                                ), //ui['image'],
                              ),
                            ),
                          ),
                    ]),
                  ),
                  title: verifyme(
                      username: widget.name.toString(), token: widget.token),
                  subtitle: getime(
                   ret: "@${widget.time2}"),
                   
                  trailing: Container(
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PopupMenuButton<String>(
                          color: Colors.grey.shade900,
                          child: const Icon(Ionicons.ellipsis_horizontal_outline,
                              color: Colors.white),
                          onSelected: (String result) {
                            setState(() {
                              // Handle result from pop-up menu
                            });
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                                value: 'Quote',
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        otheruser = widget.name;
                                      });
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            //  sum = 0;
                                            //var given_list = [1, 2, 3, 4, 5];

                                            return postR(
                                              name: widget.myusername,
                                              image: widget.image,
                                              text: widget.title,
                                              token: widget.token,
                                              id: int.parse(widget.Id),
                                              title: widget.chip,
                                              time: "@${widget.time2}",
                                              ouser: "${otheruser}",
                                            );
                                          });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.format_quote,
                                            color: Colors.grey),
                                        Text(" "),
                                        Text(
                                          'Quote',
                                          style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            PopupMenuItem<String>(
                              value: 'Report',
                              child: Row(
                                children: [
                                  Icon(Ionicons.flag, color: Colors.grey),
                                  Text(" "),
                                  Text(
                                    'Report',
                                    style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
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
                Container(
                  height: 3,
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.0),
                  width: MediaQuery.of(context).size.width * .9,
                  //height: 200,
                  /*
                   String Xx,
        String name1 ,
       int id1,
       String title1,
       List image1,
       String time1,
       String token1,
       String ouser1,
                  */
                  child: LinkDetector.highlightLinks(
                      mrbluesky(
                        widget.title.toString(),
                        widget.myusername,
                        int.parse(widget.Id),
                        widget.title,
                        widget.image,
                        widget.time1,
                        widget.token.toString(),
                        otheruser.toString(), //here
                      ),
                      Colors.cyan.shade600,
                      17.0),
                ),
                Container(
                  height: 3,
                ),
                Container(
                  padding: const EdgeInsets.only(left:10.0),
                  width: MediaQuery.of(context).size.width * .9,
                  child: Row(
                    children:[ replyget(
                      widget.title.toString(),
                      widget.name.toString(),
                      int.parse(widget.Id),
                      widget.title,
                      widget.image,
                      widget.time1,
                      widget.token.toString(),
                      widget.myusername, //this is it
                    ),]
                  ),
                ),
                Container(
                  height: 3,
                ),
                Row(children: [
                  Container(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Chip(
                          label: Text(widget.chip,
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.normal,
                              ))))
                ]), //chip
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width * .95,
                  color: Colors.grey,
                ),
                //Text(widget.peoplex["writer"].toString(),style:TextStyle(color:Colors.white)),
                
                
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      usercircle (userDataList: widget.image,usernames: widget.peoplex,token: widget.token,),
                      Text("   "),
                      Text(
                        widget.people != ""
                            ? int.parse(widget.people) > 1
                                ? "${widget.people} comments"
                                : "${widget.people} comment"
                            : "Add a comment",
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.normal, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
