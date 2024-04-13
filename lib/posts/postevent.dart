import 'package:OneStack/verifynow/verify2.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class postE extends StatefulWidget {
  postE(
      {Key? key,
      required this.name,
      required this.token,
      required this.image,
      required this.topics})
      : super(key: key);

  final String name;
  final List image;
  final List topics;
  final String token;

  @override
  State<postE> createState() => _postEState();
}

class _postEState extends State<postE> {
  final audioCache = AudioCache();

  var now; //(String now) {}
  var leo;
  var day1;
  var locationl;
  var event1;
  var datez;
  final titleController = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();

  var dearMrFantastic2;
  var dearMrFantastic =
      "Flutter"; //= widget.topics.toString().replaceAll("]", "").replaceAll(" ", "").replaceAll("[", "").split(",")[0];
  Future createPost() async {
    ////print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/event/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'username': widget.name,
        'date':
            day1.toString().replaceAll(" 00:00:00.000", ""), //an actual title
        'skills': widget.topics
            .toString()
            .replaceAll("]", "")
            .replaceAll(" ", "")
            .replaceAll("[", "")
            .split(",")
            .toString(),
        'title': titleController.text, //class teacher
        'location': locationl,
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

  late CalendarController _calendarController;
  late DateTime _selectedDate; // Variable to track the selected date

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _selectedDate = DateTime.now(); // Initialize with the current date

    audioCache.load('assets/postsmth.mp3');
    audioCache.load('assets/sendsmth.mp3');
    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      floatingActionButton:
          day1 != null && locationl != null && titleController.text != ""
              ? FloatingActionButton(
                  onPressed: () {
                    createPost();
                    titleController.clear();
                    audioCache.play('postsmth.mp3');
                    Navigator.pop(
                      context,
                    );
                  },
                  child: Center(
                    child: Icon(Ionicons.add),
                  ),
                )
              : FloatingActionButton(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text("Ensure you've filled Date and Location"),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Center(
                    child: Icon(Ionicons.add),
                  ),
                ),
      body: Column(
        children: [
          ListTile(),
          ListTile(
            title: Container(
              width: MediaQuery.of(context).size.width * .8,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
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
                  InkWell(
                      child: Text("Add an event",
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 17)))
                  /*DropdownButton(
                    dropdownColor: Colors.black,
                    value: '${dearMrFantastic}',
                    items: [
                      ...widget.topics
                          .toString()
                          .replaceAll("]", "")
                          .replaceAll(" ", "")
                          .replaceAll("[", "")
                          .split(",")
                          .map((e) => DropdownMenuItem(
                                value: e.toString(), //dearMrFantastic,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: verifyme2(
                                    username: "${e}",
                                    token: widget.token,
                                  ),
                                ),
                              )),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dearMrFantastic2 = value.toString();
                        dearMrFantastic = value.toString();
                      });
                      // Do something when the user selects an item.
                    },
                  )*/
                ],
              ),
            ),
            trailing: InkWell(
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Icon(Icons.close, color: Colors.white)),
          ),
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 650,
                                  color: Colors.grey.shade900,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.grey.shade900,
                                        child: Center(
                                            child: TableCalendar(
                                                calendarController:
                                                    _calendarController,
                                                // Handle date selection
                                                onDaySelected:
                                                    ((day, events, holidays) {
                                                  setState(() {
                                                    day1 = day;
                                                    event1 = events;
                                                  });
                                                }))),
                                      ),
                                      ListTile(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Done",
                                              style: GoogleFonts.rubik(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 22),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Chip(
                              backgroundColor: day1 != null
                                  ? Colors.cyan.shade600
                                  : Colors.white,
                              avatar: InkWell(
                                  child: Icon(Icons.calendar_today,
                                      color: Colors.white)),
                              label: Text(
                                "Date",
                                style: GoogleFonts.rubik(
                                  color: day1 == null
                                      ? Colors.cyan.shade600
                                      : Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 650,
                                  color: Colors.grey.shade900,
                                  child: Column(
                                    children: [
                                      ListTile(),
                                      Padding(
                                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextField(
                                          controller: titleController3,
                                          decoration: InputDecoration(
                                            filled: true,
                                            //fillColor: ,
                                            fillColor: Colors.grey[900],
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            //labelText: 'Username',
                                            hintText: 'Enter Location',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      ListTile(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                locationl =
                                                    titleController3.text;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Done",
                                              style: GoogleFonts.rubik(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 22),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Chip(
                              backgroundColor: locationl != null
                                  ? Colors.cyan.shade600
                                  : Colors.white,
                              avatar: InkWell(
                                  child: Icon(Icons.location_pin,
                                      color: Colors.white)),
                              label: Text(
                                "Location",
                                style: GoogleFonts.rubik(
                                  color: locationl == null
                                      ? Colors.cyan.shade600
                                      : Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        width: MediaQuery.of(context).size.width * .8,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          //autofocus: true,
                          maxLines: null,
                          onChanged: (value) {
                            setState(() {
                              //DateFormat('EEEE').format(date);
                              this.now = DateFormat('EEEE d MMM')
                                  .format(DateTime.now());
                              //returns json body from api
                              //this.courseblock = result1;
                              this.leo = DateFormat.jm().format(DateTime.now());
                            });
                            enabled:
                            false;
                          },
                          style: TextStyle(color: Colors.grey[100]),
                          //void man => value.toString();

                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              // prefixIcon: Icon(Icons.storefront),
                              filled: true,
                              labelStyle: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                              fillColor: Colors.grey[900],
                              hintText:
                                  'Tap to Share\n your \n upcoming event...',
                              hintStyle: GoogleFonts.roboto(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17)),
                          controller: titleController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _showDateDetails {}
