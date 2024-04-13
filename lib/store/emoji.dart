import 'dart:convert';

import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;

class emojistore extends StatefulWidget {
  emojistore({key, required this.username, required this.token});
  final String username;
  final String token;

  @override
  State<emojistore> createState() => _emojistoreState();
}

class _emojistoreState extends State<emojistore> {
  List Lista = [
    AnimatedEmojis.thumbsUp,
    AnimatedEmojis.clap,
    AnimatedEmojis.thumbsDown,
    AnimatedEmojis.thumbsUpDark,
    AnimatedEmojis.thumbsDownDark,
    AnimatedEmojis.thumbsUpMedium,
    AnimatedEmojis.thumbsDownMedium,
  ];

  List Listb = [
    AnimatedEmojis.laughing,
    AnimatedEmojis.smile,
    AnimatedEmojis.mindBlown,
    AnimatedEmojis.angry,
    AnimatedEmojis.moneyFace,
    AnimatedEmojis.anguished,
    AnimatedEmojis.anxiousWithSweat,
    AnimatedEmojis.cry,
    AnimatedEmojis.scared,
    AnimatedEmojis.happyCry,
    AnimatedEmojis.slightlyHappy,
    AnimatedEmojis.slightlyFrowning,
    AnimatedEmojis.smilingEyesWithHandOverMouth,
  ];

  List Listc = [
    AnimatedEmojis.cupid,
    AnimatedEmojis.fireHeart,
    AnimatedEmojis.giftHeart,
    AnimatedEmojis.oneHundred,
    AnimatedEmojis.rocket,
    AnimatedEmojis.rose,
    AnimatedEmojis.plant,
    AnimatedEmojis.heartGrow,
    AnimatedEmojis.eye,
    AnimatedEmojis.fire,
    AnimatedEmojis.fireworks,
  ];

  List Listd = [
    AnimatedEmojis.ox,
    AnimatedEmojis.alien,
    AnimatedEmojis.babyChick,
    AnimatedEmojis.pig,
    AnimatedEmojis.poop,
    AnimatedEmojis.poutingCat,
    AnimatedEmojis.checkMark,
    AnimatedEmojis.kangaroo,
  ];

  List Liste = [
    AnimatedEmojis.moneyWithWings,
    AnimatedEmojis.speakNoEvilMonkey,
    AnimatedEmojis.seeNoEvilMonkey,
    AnimatedEmojis.snake,
    AnimatedEmojis.globeShowingEuropeAfrica,
    AnimatedEmojis.glowingStar,
  ];
  var counter = 0;
  List verify = [
    [Colors.blue, "Zeus"],
    [Color(0xFFffd700), "Gold"],
    [Colors.green, "green"],
    [Colors.blueGrey.shade900, "BG"]
  ];

  @override
  Widget build(BuildContext context) {
    int dontfuckem = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade600,
        title: const Text('Store'),
        actions: [
        
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Ionicons.information_circle,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
                title: Text("Get verified",
                    style: GoogleFonts.rubik(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Ionicons.information_circle,
                    color: Colors.white,
                  ),
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...verify.map((x) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return verifiedb(
                                  iconname: x.last,
                                  icon: Icons.verified,
                                  price: "100",
                                  username: widget.username,
                                  xz: x.first);
                            });
                      },
                      child: Card(
                        color: Colors.transparent,
                        child: Stack(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children: [
                            Icon(
                              Icons.verified,
                              color: x.first,
                              size: 128,
                            ),
                            const Positioned(
                                right: 0,
                                top: 0,
                                child:
                                    Icon(Icons.add_circle, color: Colors.cyan)),
                          ],
                        ),
                      ),
                    )),
                
              ]),
            ),
            ListTile(
              title: Text("Tips for your Emo-wallet:",
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan.shade600)),
            ),

            ListTile(
              title: Text("Get these hands",
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...Lista.map((x) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return whentapped(
                                  emoji: x,
                                  ll: "lista|${Lista.indexOf(x).toString()}",
                                  emojiname: x.toString(),
                                  username: widget.username,
                                  token: widget.token,
                                  price: "100");
                            });
                      },
                      child: Card(
                          color: Colors.transparent,
                          child: Stack(children: [
                            AnimatedEmoji(
                              x,
                              size: 128,
                            ),
                            const Positioned(
                                right: 0,
                                top: 0,
                                child:
                                    Icon(Icons.add_circle, color: Colors.cyan))
                          ])),
                    )),
              ]),
            ),
            ListTile(
              title: Text("Why the face",
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...Listb.map((x) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return whentapped(
                                  emoji: x,
                                  ll: "listb|${Listb.indexOf(x).toString()}",
                                  emojiname: x.toString(),
                                  username: widget.username,
                                  token: widget.token,
                                  price: "100");
                            });
                      },
                      child: Card(
                          color: Colors.transparent,
                          child: Stack(children: [
                            AnimatedEmoji(
                              x,
                              size: 128,
                            ),
                            const Positioned(
                                right: 0,
                                top: 0,
                                child:
                                    Icon(Icons.add_circle, color: Colors.cyan))
                          ])),
                    )),
              ]),
            ),
            ListTile(
              title: Text("This Feelin",
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...Listc.map((x) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return whentapped(
                                  emoji: x,
                                  ll: "listc|${Listc.indexOf(x).toString()}",
                                  emojiname: x.toString(),
                                  username: widget.username,
                                  token: widget.token,
                                  price: "100");
                            });
                      },
                      child: Card(
                          color: Colors.transparent,
                          child: Stack(children: [
                            AnimatedEmoji(
                              x,
                              size: 128,
                            ),
                            const Positioned(
                                right: 0,
                                top: 0,
                                child:
                                    Icon(Icons.add_circle, color: Colors.cyan))
                          ])),
                    )),
              ]),
            ),
            ListTile(
              title: Text("Get an Emmo",
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...Listd.map((x) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return whentapped(
                                  emoji: x,
                                  ll: "listd|${Listd.indexOf(x).toString()}",
                                  emojiname: x.toString(),
                                  username: widget.username,
                                  token: widget.token,
                                  price: "100");
                            });
                      },
                      child: Card(
                          color: Colors.transparent,
                          child: Stack(children: [
                            AnimatedEmoji(
                              x,
                              size: 128,
                            ),
                            const Positioned(
                                right: 0,
                                top: 0,
                                child:
                                    Icon(Icons.add_circle, color: Colors.cyan))
                          ])),
                    )),
              ]),
            ),
            ListTile(
              title: Text("Get one",
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...Liste.map((x) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return whentapped(
                                  emoji: x,
                                  ll: "liste|${Liste.indexOf(x).toString()}",
                                  emojiname: x.toString(),
                                  username: widget.username,
                                  token: widget.token,
                                  price: "90");
                            });
                      },
                      child: Card(
                          color: Colors.transparent,
                          child: Stack(children: [
                            AnimatedEmoji(
                              x,
                              size: 128,
                            ),
                            const Positioned(
                                right: 0,
                                top: 0,
                                child:
                                    Icon(Icons.add_circle, color: Colors.cyan))
                          ])),
                    )),
              ]),
            ),
            ListTile(), ListTile()
            //DemoHoverEmoji(),
          ],
        ),
      ),
    );
  }
}

class verifiedb extends StatefulWidget {
  verifiedb({
    Key? key,
    required this.iconname,
    required this.price,
    required this.username,
    required this.icon,
    required this.xz,
  }) : super(key: key);

  final String iconname;
  final String price;
  final IconData icon;
  final String username;
  final Color xz;

  @override
  State<verifiedb> createState() => _verifiedbState();
}

class _verifiedbState extends State<verifiedb> {
  var dontfuckem = 0;
  void createverification(String quantity) async {
    //print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/verified/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        "username1": widget.username,
        "image": quantity,
      }),
    );
    ////print(jsonDecode(response1.data.toString()) );
    //works => //print(token['token']);

    if (response1.statusCode == 201) {
      //print("yea it happened");
      //print(jsonDecode(response1.body.toString()));
    }
    ;

    //});
//save the token for next time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      Icon(
                        widget.icon,
                        color: widget.xz,
                        size: 128,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  child: Text("Price: ${widget.price} KES",
                      style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ]),
            Container(height: 20),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                child: Text(
                  "Top up with Mpesa", //changed
                  style: GoogleFonts.rubik(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  createverification(widget.iconname);
                  Navigator.pop(context);
                  //print(State);
                },
              ),
            ),
            Container(height: 30),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                child: Text(
                  "Cancel", //changed
                  style: GoogleFonts.rubik(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  //print(State);
                },
              ),
            ),
          ],
        ));
  }
}

class whentapped extends StatefulWidget {
  whentapped(
      {Key? key,
      required this.emoji,
      required this.emojiname,
      required this.ll,
      required this.username,
      required this.token,
      required this.price})
      : super(key: key);

  final AnimatedEmojiData emoji;
  final String ll;
  final String emojiname;
  final String username;
  final String token;
  final String price;
  @override
  State<whentapped> createState() => _whentappedState();
}

class _whentappedState extends State<whentapped> {
  int dontfuckem = 0;
  void createPost(String quantity) async {
    //print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/bemjs/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        "username": widget.username,
        "quantity": quantity,
        "emojiname": widget.ll,
      }),
    );
    ////print(jsonDecode(response1.data.toString()) );
    //works => //print(token['token']);

    if (response1.statusCode == 201) {
      //print("yea it happened");
      //print(jsonDecode(response1.body.toString()));
    }
    ;

    //});
//save the token for next time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedEmoji(
                  widget.emoji,
                  size: 128,
                ),
              ],
            ),
            Container(height: 20),
            Container(
              width: MediaQuery.of(context).size.height * .15,
              //color:darkmode?Colors.black.withOpacity(0.4):Colors.white.withOpacity(0.2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //width: MediaQuery.of(context).size.height*.3,
                      child: InkWell(
                          child: CircleAvatar(
                              child: const Icon(Icons.add, color: Colors.green),
                              radius: 15,
                              backgroundColor:
                                  Colors.grey[200]?.withOpacity(0.4)),
                          onTap: () {
                            //int io7 = 0;
                            setState(() {
                              dontfuckem++;
                            });
                          }),
                    ),
                    const Text('\t'),
                    Text(dontfuckem > 0 ? dontfuckem.toString() : '1',
                        style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 19)),
                    const Text('\t'),
                    InkWell(
                        child: CircleAvatar(
                            child:
                                const Icon(Icons.remove, color: Colors.green),
                            radius: 15,
                            backgroundColor:
                                Colors.grey[200]?.withOpacity(0.4)),
                        onTap: () {
                          setState(() {
                            dontfuckem > 1 ? dontfuckem-- : '';
                          });
                          //print(i['name']);
                        }),
                  ]),
            ),
            Container(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  child: Text(
                      "Tip Price: ${(dontfuckem > 1 ? int.parse(widget.price) * dontfuckem : widget.price)} KES",
                      style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ]),
            Container(height: 20),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                child: Text(
                  "Top up with Mpesa", //changed
                  style: GoogleFonts.rubik(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  createPost("${(dontfuckem > 1 ? dontfuckem : "1")}");
                  Navigator.pop(context);
                  //print(State);
                },
              ),
            ),
            Container(height: 30),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                child: Text(
                  "Cancel", //changed
                  style: GoogleFonts.rubik(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  //print(State);
                },
              ),
            ),
          ],
        ));
  }
}
