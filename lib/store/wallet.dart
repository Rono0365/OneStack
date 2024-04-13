import "dart:convert";

import "package:animated_emoji/emoji.dart";
import "package:animated_emoji/emojis.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:ionicons/ionicons.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../verifynow/editprofile.dart";
import "../verifynow/verifyservice.dart";
import 'package:http/http.dart' as http;

class wallet extends StatefulWidget {
  const wallet({
    Key? key,
    required this.token,
    required this.pics,
    required this.username,
    required this.location,
  }) : super(key: key);
  final String token;
  final List pics;
  final String username;
  final String location;
  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  var verifiedx;
  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.token}',
    };
    //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('https://afleet.co.ke/bemjs/'),
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

  List lista = [
    AnimatedEmojis.thumbsUp,
    AnimatedEmojis.clap,
    AnimatedEmojis.thumbsDown,
    AnimatedEmojis.thumbsUpDark,
    AnimatedEmojis.thumbsDownDark,
    AnimatedEmojis.thumbsUpMedium,
    AnimatedEmojis.thumbsDownMedium,
  ];

  List listb = [
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

  List listc = [
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

  List listd = [
    AnimatedEmojis.ox,
    AnimatedEmojis.alien,
    AnimatedEmojis.babyChick,
    AnimatedEmojis.pig,
    AnimatedEmojis.poop,
    AnimatedEmojis.poutingCat,
    AnimatedEmojis.checkMark,
    AnimatedEmojis.kangaroo,
  ];

  List liste = [
    AnimatedEmojis.moneyWithWings,
    AnimatedEmojis.speakNoEvilMonkey,
    AnimatedEmojis.seeNoEvilMonkey,
    AnimatedEmojis.snake,
    AnimatedEmojis.globeShowingEuropeAfrica,
    AnimatedEmojis.glowingStar,
  ];
  getopp(var z) {
    List lista = [
    AnimatedEmojis.thumbsUp,
    AnimatedEmojis.clap,
    AnimatedEmojis.thumbsDown,
    AnimatedEmojis.thumbsUpDark,
    AnimatedEmojis.thumbsDownDark,
    AnimatedEmojis.thumbsUpMedium,
    AnimatedEmojis.thumbsDownMedium,
  ];

  List listb = [
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

  List listc = [
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

  List listd = [
    AnimatedEmojis.ox,
    AnimatedEmojis.alien,
    AnimatedEmojis.babyChick,
    AnimatedEmojis.pig,
    AnimatedEmojis.poop,
    AnimatedEmojis.poutingCat,
    AnimatedEmojis.checkMark,
    AnimatedEmojis.kangaroo,
  ];

  List liste = [
    AnimatedEmojis.moneyWithWings,
    AnimatedEmojis.speakNoEvilMonkey,
    AnimatedEmojis.seeNoEvilMonkey,
    AnimatedEmojis.snake,
    AnimatedEmojis.globeShowingEuropeAfrica,
    AnimatedEmojis.glowingStar,
  ];
    var x = z.split('|').first;
    var y = z.split('|').last;
    var d = x[int.parse(y)];
    return d.toString();
  }
   getstuff(var z) {
    var x = z.split('|').first;
    var y = z.split('|').last;
    var d = x;
    return d.toString();
  }

  @override
  Widget build(BuildContext context) {
    inmat();
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(children: [
          ListTile(),
          Center(
              child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.cyan.shade600,
          )),
          const SizedBox(height: 5),
          Column(
            children: [
              Text("${widget.username}",
                  style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text(
                  widget.location
                      .toString()
                      .replaceAll("(", "")
                      .replaceAll(")", ""),
                  style: GoogleFonts.rubik(
                      fontSize: 17, color: Colors.blueGrey.shade200)),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Icon(Ionicons.send_outline),
                ),
                CircleAvatar(
                  radius: 25,
                  child: Icon(Ionicons.receipt),
                )
              ],
            ),
          ),
          const SizedBox(height: 35),
          Container(
            height: MediaQuery.of(context).size.height * .56,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(children: [
                ...verifiedx.map((x) => InkWell(
                      onTap: () {
                        /*showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return whentapped(
                                  emoji: x,
                                  ll: "lista|${Lista.indexOf(x).toString()}",
                                  emojiname: x.toString(),
                                  username: widget.username,
                                  token: widget.token,
                                  price: "100");
                            });*/
                      },
                      child: Card(
                          color: Colors.transparent,
                          child: Column(children: [
                            Text(getopp(x["emojiname"]),
                                style: TextStyle(color: Colors.white)),
                            /*AnimatedEmoji(
                              x["emojiname"].split("|").first[int.parse(x["emojiname"].split("|").last)],
                              size: 128,
                            ),*/
                          ])),
                    )),
              ]),
            ),
          ),
        ]));
  }
}
