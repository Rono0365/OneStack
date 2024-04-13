import 'dart:convert';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:OneStack/compchat/comments.dart';
import 'package:OneStack/posts/replypost.dart';
import 'package:OneStack/verifynow/verifyservice.dart';
import 'package:OneStack/widgets/linkdetector.dart';
import 'package:OneStack/widgets/replywidget.dart';
import 'package:OneStack/widgets/timexx.dart';
import 'package:OneStack/widgets/usercircles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../store/wallet2.dart';

class homewidget extends StatefulWidget {
  homewidget(
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
      required this.imagez,
      required this.imagez1,
      required this.imagez2,
      required this.imagez3,
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
  final String imagez;
  final String imagez1;
  final String imagez2;
  final String imagez3;

  final List image;
  final String time1;
  final String time2;
  final String text;

  @override
  State<homewidget> createState() => _homewidgetState();
}

class _homewidgetState extends State<homewidget> {
  @override
  Widget build(BuildContext context) {
    rono3() {
      showDialog(
          //student id card here
          context: context,
          builder: (context) {
            /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
            return Container(
              child: AlertDialog(
                backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                content: Container(
                    // height: MediaQuery.of(context).size.height * .35,
                    width: 900,
                    height: 500,
                    child: wallet2(
                      username: widget.name,
                      token: widget.token,
                    )),
              ),
            );
          });
    }

    double imageHeight = MediaQuery.of(context).size.height * 0.5;
    double imageWidth = 350;
    double aspectRatio = imageWidth / imageHeight;

// Ratio the image down to the height provided
    double scaledHeight = imageHeight;
    double scaledWidth = scaledHeight * aspectRatio;

    var otheruser = "exampluser";
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
          ? Xx.split(',')[3].toString().replaceAll("]", "")
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
          ? replywidget(
              //postdata: widget.postdata,
              name: name1,
              id: id1,
              title: title1,
              token: token1,
              image: image1,
              time: Xx.split(',')[2]
                  .toString()
                  .replaceAll("]", "")
                  .replaceAll("@", ""),
              ouser: Xx.split(',')[1]
                  .toString()
                  .replaceAll("]", "")
                  .replaceAll(" ", ""),
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
    Image imaha;

    if (widget.imagez != "notitle") {
      imaha = Image.memory(
        Uint8List.fromList(base64.decode(widget.imagez)),
      );
    } else {
      imaha = Image.asset("assets/images/no_image.png");
    }
    var heighth = widget.imagez != "notitle" ? imaha.height : 0.0;
    return InkWell(
      child: Container(
          padding: EdgeInsets.all(5.0),
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
                        backgroundColor: Colors.cyan.shade100,
                        child: Center(
                          child: Text(
                            widget.name.toString().substring(0, 1),
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan.shade600),
                          ),
                        ),
                      ),
                    ),
                    ...widget.image
                        .where((c) => c['username1'] == widget.name.toString())
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
                subtitle: getime(ret: "${widget.time2}"),
                trailing: Container(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButton<String>(
                        color: Colors.grey.shade900,
                        child: Icon(Ionicons.ellipsis_horizontal_outline,
                            color: Colors.white),
                        onSelected: (String result) {
                          setState(() {
                            // Handle result from pop-up menu
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                         widget.name != widget.myusername? PopupMenuItem<String>(
                            value: 'Message',
                            child: Row(
                              children: [
                                const Icon(Icons.chat,
                                    color: Colors.grey),
                                Text(" "),
                                Text(
                                  'message',
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ):PopupMenuItem<String>(
                            value: 'Message',
                            child:Row(
                              children: [
                                const Icon(Icons.delete,
                                    color: Colors.grey),
                                Text(" "),
                                Text(
                                  'Delete Post',
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                              ],
                            ),),
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
                            value: 'mute',
                            child: Row(
                              children: [
                                const Icon(Ionicons.eye_off,
                                    color: Colors.grey),
                                Text(" "),
                                Text(
                                  'mute',
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
                padding: const EdgeInsets.only(left: 5.0),

                /// width: MediaQuery.of(context).size.width * .9,
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
                child: Row(children: [
                  Container(
                      width: MediaQuery.of(context).size.width * .88,
                      padding: const EdgeInsets.only(left: 12.0),
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
                          19.0))
                ]),
              ),
              Container(
                height: 3,
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: replyget(
                        widget.title.toString(),
                        widget.name.toString(),
                        int.parse(widget.Id),
                        widget.title,
                        widget.image,
                        widget.time2, //+"at"+widget.time1,
                        widget.token.toString(),
                        widget.myusername, //this is it
                      )),
                ],
              ),
              Container(
                height: 3,
              ),
              
              widget.imagez != "notitle"
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                    
                      child: widget.imagez1 == "notitle"
                          ? InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      //  sum = 0;
                                      //var given_list = [1, 2, 3, 4, 5];

                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        color: Colors.black,
                                        constraints: BoxConstraints(
                                          maxHeight: MediaQuery.of(context)
                                              .size
                                              .height,
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Image.memory(
                                              Uint8List.fromList(
                                                  base64.decode(widget.imagez)),
                                              //color: Colors.black,
                                              //width: scaledWidth,
                                              fit: BoxFit.cover,
                                              gaplessPlayback: true,
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child:  Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxHeight:  MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .55
                                             ,
                                          minWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .95
                                              ,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.memory(
                                            Uint8List.fromList(
                                                base64.decode(widget.imagez)),
                                    
                                            //width: scaledWidth,
                                            fit: BoxFit.cover,
                                            gaplessPlayback: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .35,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...[
                                      widget.imagez,
                                      widget.imagez1,
                                      widget.imagez2,
                                      widget.imagez3
                                    ].map((e) => e == "notitle"
                                        ? const SizedBox()
                                        : InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder: (context) {
                                                    //  sum = 0;
                                                    //var given_list = [1, 2, 3, 4, 5];

                                                    return Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      color: Colors.black,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                        minWidth: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                      ),
                                                      child: Center(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          child: Image.memory(
                                                            Uint8List.fromList(
                                                                base64.decode(e
                                                                    .replaceAll(
                                                                        " ",
                                                                        ""))),
                                                            //color: Colors.black,
                                                            //width: scaledWidth,
                                                            fit: BoxFit.cover,
                                                            gaplessPlayback:
                                                                true,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: e == "notitle"
                                                ? SizedBox()
                                                : Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .35,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .85,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            minHeight: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .35,
                                                            minWidth: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .85,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            child: e ==
                                                                    "notitle"
                                                                ? null
                                                                : Image.memory(
                                                                    Uint8List
                                                                        .fromList(
                                                                      base64
                                                                          .decode(
                                                                       e
                                                                      ),
                                                                    ),

                                                                    //width: scaledWidth,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    gaplessPlayback:
                                                                        true,
                                                                  ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                          ))
                                  ],
                                ),
                              ),
                            ))
                  : const SizedBox(),

              /*Row(children: [
                    Container(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Chip(
                            label: Text(widget.chip,
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.normal,
                                ))))
                  ]),*/ //chip
              Container(
                padding: EdgeInsets.only(top: 10),
              ),
              Container(
                height: 0.05,
                width: MediaQuery.of(context).size.width * .95,
                color: Colors.grey,
              ),
              Container(
                height: 5,
                // width: MediaQuery.of(context).size.width * .95,
                //color: Colors.grey,
              ),
              //Text(widget.peoplex["writer"].toString(),style:TextStyle(color:Colors.white)),
//comment icon was here
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => rono3(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 10.0, right: 15.0, bottom: 8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade900,
                          child: Icon(
                            Ionicons.gift_outline,
                            color: Colors.white,
                            size: 23,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 10.0, right: 15.0, bottom: 8.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade900,
                        child: Icon(
                          Ionicons.heart_outline,
                          color: Colors.white,
                          size: 23,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 10.0, right: 15.0, bottom: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade900,
                            child: Icon(
                              Ionicons.chatbubble_outline,
                              color: Colors.white,
                              size: 23,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 3.0, right: 3.0),
                            child: Text(
                              widget.people != ""
                                  ? int.parse(widget.people) > 1
                                      ? "${widget.people}"
                                      : ""
                                  : "",
                              style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade600),
                            ),
                          )
                        ],
                      ),
                    ),
                    /*Icon(
                        Ionicons.chatbox,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text("   "),
                      usercircle(
                        userDataList: widget.image,
                        usernames: widget.peoplex,
                        token: widget.token,
                      ),
                      Text("   "),
                      Text(
                            widget.people != ""
                                ? int.parse(widget.people) > 1
                                    ? "${widget.people}"
                                    : "${widget.people}"
                                : "Add a comment",
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                                fontWeight: FontWeight.normal, color: Colors.grey.shade600),
                          )*/
                  ],
                ),
              ),
              widget.people != "0"
                  ? Container(
                      height: 50,
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(0.6),
                        // border: Border.all(color: Colors.deepPurple.withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('View replies',
                                style: GoogleFonts.rubik(color: Colors.grey)),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('${widget.people} replies',
                                    style:
                                        GoogleFonts.rubik(color: Colors.grey)),
                                Icon(Ionicons.arrow_forward,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              Container(height: 5),
              Container(
                height: 0.2,
                width: MediaQuery.of(context).size.width * .95,
                color: Colors.grey,
              ),
            ],
          )),
    );
  }
}
