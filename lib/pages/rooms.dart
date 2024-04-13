import "package:flutter/material.dart";
import "dart:convert";

import "package:google_fonts/google_fonts.dart";

import "../posts/clubpage.dart";
import "../verifynow/verifyservice.dart";

class GridViewPage extends StatefulWidget {
  final List listOfStuff;
   final List pic_url;
    final List information;
  final String username;
  final String token;

  const GridViewPage(
      {Key? key,
      required this.listOfStuff,
      required this.username,
      required this.pic_url,
      required this.information,
      required this.token})
      : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final List<Color> colors2 = <Color>[
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
  ];
  final List<Color> colors = <Color>[
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.cyan.shade100,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.deepPurple.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100
  ];

  List<String> utopia(List<String> topics, var verifiedx) {
    List<String> y = [];
    List<String> y1 = [];

    void vortex(String x) {
      verifiedx.forEach((ui) {
        if (ui['username1'] == x.replaceAll(" ", "") &&
            ui["image"] == "realZeus") {
          y.add(x);
        }
      });
    }

    void vortex2(String x) {
      verifiedx.forEach((ui) {
        if (ui['username1'] == x.replaceAll(" ", "") && ui["image"] == "Zeus") {
          y1.add(x);
        }
      });
    }

    topics.forEach((topic) {
      vortex(topic);
      vortex2(topic);
    });
    var k =
        topics.where((item) => !y.contains(item.replaceAll(" ", ""))).toList();
    var xx = k.where((item) => !y1.contains(item.replaceAll(" ", ""))).toList();

    return [...y, ...y1, ...xx];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: ListView(
        children: [
          ListTile(),
          Padding(
            padding: const EdgeInsets.only(left:20.0,bottom: 20.0),
            child: Row(children: [
              Text("Hello, ",style:GoogleFonts.lexend(color:Colors.white,fontSize: 17)),
              verifyme(username:widget.username,token: widget.token,),
              
            ],),
          ),
           
          Center(
            child: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              children: [
                //i know this is too much but trust me it works

                ...widget.listOfStuff.last
                    .toString()
                    .replaceAll("Myself", "Personal")
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .split(",")
                    .map(
                      (o) => InkWell(
                         onTap: () {
                                                      showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          context: context,
                                                          builder: (context) {
                                                            //  sum = 0;
                                                            //var given_list = [1, 2, 3, 4, 5];

                                                            return clubZ(
                                                              sky3: widget.listOfStuff,
                                                              kala: colors[widget.listOfStuff.last
                                  .toString()
                                  .replaceAll("Myself", "Personal")
                                  .replaceAll("[", "")
                                  .replaceAll("]", "")
                                  .split(",")
                                  .indexOf(o)],
                                                              pics: widget.pic_url,
                                                              username: widget
                                                                  .username,
                                                              token: widget
                                                                  .username,
                                                              title: o,
                                                              information:
                                                                  widget.information
                                                                      .reversed
                                                                      .toList(),
                                                            );
                                                          });
                                                    },
                        child: Container(
                            decoration: BoxDecoration(
                              color: colors[widget.listOfStuff.last
                                  .toString()
                                  .replaceAll("Myself", "Personal")
                                  .replaceAll("[", "")
                                  .replaceAll("]", "")
                                  .split(",")
                                  .indexOf(o)],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Center(
                                child: Text(
                              o.toString(),
                              style: GoogleFonts.rubik(
                                fontSize: 19,
                                color: colors2[widget.listOfStuff.last
                                    .toString()
                                    .replaceAll("Myself", "Personal")
                                    .replaceAll("[", "")
                                    .replaceAll("]", "")
                                    .split(",")
                                    .indexOf(o)],
                              ),
                            ))),
                      ),
                    )
                //.map((o) => Text(o.toString()))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
