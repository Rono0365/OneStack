import 'dart:convert';

import 'package:OneStack/newchat/newchat.dart';
import 'package:OneStack/pages/network.dart';
import 'package:OneStack/verifynow/verifyservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:ionicons/ionicons.dart';

class SortChat extends StatefulWidget {
  final List pics;
  final String mUsername;
  final String token;
  final String userid;
  SortChat(
      {Key? key,
      required this.pics,
      required this.mUsername,
      required this.token,
      required this.userid})
      : super(
          key: key,
        );

  @override
  State<SortChat> createState() => _SortChatState();
}

class _SortChatState extends State<SortChat> {
  final audioCache = AudioCache();

  String currentRoom = '';
  String newRoomName = '';
  var messages = [];
  var oldstuff = [];
  var thislove = '';

  List<String> rooms = [];

  /* void createRoom() async {
    final url = Uri.parse('http://onestack-verfchat.onrender.com/${mUsername}');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'name': newRoomName});
    //retrievep("${ bewRoomName}");

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      setState(() {
        rooms.add(newRoomName);
        newRoomName = '';
      });
    } else {
      //print('Error occurred while creating room: ${response.body}');
    }
  }*/
  lastmess(var z) {
    var k = z.split("],").where((e) => e != null).last;
    return k
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(",", "|")
        .split("|");
  }

  getFirstTwoValues(List list) {
    List a = list;
    var b = menw2(a);
    return b.toString();
  }

  getFirstTwoValues2(List list) {
    List a = list;
    var b = menw3(a);
    return b.toString();
  }

  getme2(String qx) {
    final x2 = messages != null ? messages : [];
    // final v = x.last;
    final mess2 = x2.map((z) => z[1]);
    //final mess = x.map((z)=>z[1]);
    final list_of_mes2 = mess2.where((x1) => x1[0] == "$qx");
    //final list_of_mes= mess.where((x1)=>x1[0] == "RetRono");//here get the righth users
    return list_of_mes2.toList();
  }

  String menw2(List z) {
    //last mess
    var w = z.where((e) => e != null).toList();
    //print(w);

    var y = '';

    if (w.length > 1) {
      var x = w;
      y = x[1].toString();
    }

    return y;
  }

  String menw3(List z) {
    //time
    var w = z.where((e) => e != null).toList();
    //print(w);

    var y = '';

    if (w.length > 1) {
      var x = w;
      y = x[3].toString();
    }

    return y;
  }

  List<dynamic> menw(List<dynamic> z) {
    // this is A masterpiece
    List<dynamic> up = oldstuff;
    List<dynamic> w = z.isEmpty
        ? []
        : z.reversed
            .where((element) =>
                element.length > 1 &&
                element[1].length > 0 &&
                element[1][0] != null)
            .map((e) => e[1][0])
            .toSet()
            .toList();

    if (thislove != getFirstTwoValues2(lastmess(getme2(w.first).toString()))) {
      audioCache.play('postsmth.mp3');
      up.remove(w.first);
    }

    List<dynamic> itemsNotInUp = w.where((item) => !up.contains(item)).toList();

    //print("choooot" + itemsNotInUp.toString());

    setState(() {
      this.thislove = getFirstTwoValues2(lastmess(getme2(w.first).toString()));
    });

    return itemsNotInUp;
  }

  void retrieveMessages(String room) async {
    final url =
        Uri.parse('https://onestack-verfchat.onrender.com/messages/${room}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final messageList = data['messages']; //
      setState(() {
        messages = messageList;
        //print("this point" + messages.toString());
        //retrievep(mUsername);
      });
    } else {
      //print('Failed to retrieve messages. Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    retrieveMessages(widget.mUsername);

    audioCache.load('assets/postsmth.mp3');
    audioCache.load('assets/sendsmth.mp3');
    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    retrieveMessages(widget.mUsername);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blueGrey.shade900,
      
      //floatingActionButton: 
     
      body: Card(
        elevation: 0,
        color: Colors.grey.shade900,
        child: Column(
          children: [
            
            messages.isEmpty
                ? Container(
                    height: MediaQuery.of(context).size.height * .8,
                    child: Center(
                      child: Text(
                        """


Welcome to StackPile chat!


Start a direct chat 
with other
 OneStack Users.


""",
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ))
                : Container(
                    height: MediaQuery.of(context).size.height * .8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...menw(messages.toList()).map((room) => InkWell(
                                onTap: () {
                                  setState(() {
                                    oldstuff.add(room);
                                  });

                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        //  sum = 0;
                                        //var given_list = [1, 2, 3, 4, 5];

                                        return ChatScreen(
                                          ouser: room.toString(),
                                          pic_url: widget.pics,
                                          mUsername: widget.mUsername,
                                        );
                                      });
                                  // menw(messages.toList()).add(room);
                                },
                                child: Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: ListTile(
                                          leading: room == ""
                                              ? Container()
                                              : Container(
                                                  child: Stack(children: [
                                                    CircleAvatar(
                                                      radius: 25,
                                                      backgroundColor:
                                                          Colors.cyan.shade50,
                                                      child: Center(
                                                        child: Text(room
                                                            .toString()
                                                            .substring(0, 1),style:GoogleFonts.rubik(color:Colors.cyan.shade600,fontWeight: FontWeight.bold)),
                                                      ),
                                                    ),
                                                    ...widget.pics == null
                                                        ? [
                                                            {
                                                              "id": 126,
                                                              "username1":
                                                                  "RonoRet",
                                                              "image":
                                                                  "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                                            },
                                                            {
                                                              "id": 127,
                                                              "username1":
                                                                  "RetRono",
                                                              "image":
                                                                  "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                                            }
                                                          ]
                                                            .where((c) =>
                                                                c['username1'] ==
                                                                room.toString())
                                                            .map(
                                                              (ui) =>
                                                                  CircleAvatar(
                                                                radius: 25,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,

                                                                backgroundImage:
                                                                    NetworkImage(
                                                                  ui['image']
                                                                      .toString(),
                                                                ), //ui['image'],
                                                              ),
                                                            )
                                                        : widget.pics
                                                            .where((c) =>
                                                                c['username1'] ==
                                                                room.toString())
                                                            .map(
                                                              (ui) =>
                                                                  CircleAvatar(
                                                                radius: 25,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,

                                                                backgroundImage:
                                                                    NetworkImage(
                                                                  ui['image'],
                                                                ), //ui['image'],
                                                              ),
                                                            ),
                                                  ]),
                                                ),
                                          title: verifyme(
                                              username: room.toString(),
                                              token: widget.token),
                                          subtitle: Container(
                                            child: Text(
                                              getFirstTwoValues(lastmess(
                                                  getme2(room.toString())
                                                      .toString())),
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.grey),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          trailing: Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .19,
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 3,
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                    Text(
                                                      getFirstTwoValues2(
                                                          lastmess(getme2(room
                                                                  .toString())
                                                              .toString())),
                                                      style: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            height: 0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .80,
                                            color: Colors.grey,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          ...oldstuff.reversed.map((room) => InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        //  sum = 0;
                                        //var given_list = [1, 2, 3, 4, 5];

                                        return ChatScreen(
                                          ouser: room.toString(),
                                          pic_url: widget.pics,
                                          mUsername: widget.mUsername,
                                        );
                                      });
                                  // menw(messages.toList()).add(room);
                                },
                                child: Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: room == ""
                                            ? null
                                            : Container(
                                                child: Stack(children: [
                                                  CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    child: Center(
                                                      child: Text(
                                                          "${room.substring(0, 1)}"),
                                                    ),
                                                  ),
                                                  ...widget.pics == null
                                                      ? [
                                                          {
                                                            "id": 126,
                                                            "username1":
                                                                "RonoRet",
                                                            "image":
                                                                "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                                          },
                                                          {
                                                            "id": 127,
                                                            "username1":
                                                                "RetRono",
                                                            "image":
                                                                "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                                          }
                                                        ]
                                                          .where((c) =>
                                                              c['username1'] ==
                                                              room.toString())
                                                          .map(
                                                            (ui) =>
                                                                CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,

                                                              backgroundImage:
                                                                  NetworkImage(
                                                                ui['image']
                                                                    .toString(),
                                                              ), //ui['image'],
                                                            ),
                                                          )
                                                      : widget.pics
                                                          .where((c) =>
                                                              c['username1'] ==
                                                              room.toString())
                                                          .map(
                                                            (ui) =>
                                                                CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,

                                                              backgroundImage:
                                                                  NetworkImage(
                                                                ui['image'],
                                                              ), //ui['image'],
                                                            ),
                                                          ),
                                                ]),
                                              ),
                                        title: verifyme(
                                            username: room.toString(),
                                            token: widget.token),
                                        subtitle: room != ""
                                            ? Text(
                                                "Tap to message!",
                                                style: GoogleFonts.roboto(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.grey),
                                              )
                                            : Text(
                                                "",
                                                style: GoogleFonts.roboto(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.grey),
                                              ),
                                        trailing: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .19,
                                              child: Row(
                                                children: [
                                                  room != ""
                                                      ? Text(
                                                          getFirstTwoValues2(
                                                              lastmess(getme2(room
                                                                      .toString())
                                                                  .toString())),
                                                          style:
                                                              GoogleFonts.rubik(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey),
                                                        )
                                                      : Text(
                                                          "",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          room != ""
                                              ? Container(
                                                  padding: EdgeInsets.all(10.0),
                                                  height: 0.07,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .80,
                                                  color: Colors.grey,
                                                )
                                              : Container()
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
