import 'dart:convert';

import 'package:OneStack/compchat/comments.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    Key? key,
    required this.username,
    required this.token,
    required this.information,
    required this.pics,
  }) : super(key: key);

  final String username;
  final List information;

  final String token;
  final List pics;
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  stacknotes() {
    /*
   information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .length
                                                    .toString()
  */
    var k = widget.information.reversed
        .where((x) => x["writer"] == widget.username)
        .where((u) => u['title'].contains('mop'))
        .where((f) => f['id'] != null);
    var n = [
      ...k.map((x) => widget.information.reversed
          .where((u) =>
              u['title'].contains('message') &&
              u["writer"] != widget.username &&
              u['whoiswho'] == x['id'].toString())
          .toSet()
          .toList())
    ];

    return n; //.fold(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse(element.toString())).toString();
  }

  truth(var t) {
    var yy = t
        .toList()
        .reversed
        .where((h) => h.toString() != "()")
        .map((x) => x.where((g) => g != null).map((c) => c));
    var zz = [...yy];

    return zz;
  }

  @override
  void initState() {
    super.initState();

    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          leading: SizedBox(),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            ListTile(
              title: Text(
                "Notifications",
                style: GoogleFonts.rubik(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              trailing: Icon(Ionicons.notifications, color: Colors.white),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...stacknotes()
                        .toList()
                        .reversed
                        .where((h) => h.toString() != "()")
                        .map((x) => Column(
                              children: [
                                ...x.where((g) => g != null).map((c) => InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FriendMess3(
                                                      name: "",
                                                      id: "",
                                                      image: "",
                                                      ouser: "",
                                                      text:"",
                                                      time: "",
                                                      pics: widget.pics,
                                                      title: c[
                                                          "whoiswho"], //id of the chat

                                                      token: widget
                                                          .token, //randombla
                                                      myname:
                                                          "onestack", //class teacher
                                                      user: widget
                                                          .username, //class
                                                    )));
                                      },
                                      child: NotificationCard(
                                        pic_url: widget.pics,
                                        title: c["writer"].toString(),
                                        message: c["mation"].toString(),
                                        iconData: Icons.notifications_on,
                                      ),
                                    )) // Convert the Iterable to a List to use the sort method
                                // Convert and sort the List based on the numeric value of the 'id' property
                              ],
                            ))
                        .toSet()
                        .toList(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final IconData iconData;
  final Color iconColor;
  final List pic_url;
  NotificationCard({
    required this.title,
    required this.pic_url,
    required this.message,
    required this.iconData,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 18,
               backgroundColor: Colors.cyan.shade600,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.cyan.shade600,
                child: Center(
                  child: Icon(Ionicons.star_half),
                ),
              ),
            ),
            title: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(children: [
                        CircleAvatar(
                          radius: 12,
                          // backgroundColor: Colors.cyan.shade600,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey,
                            child: Center(
                              child: Text(title.toString().substring(0, 1)),
                            ),
                          ),
                        ),
                        ...pic_url.where((c) => c['username1'] == title).map(
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${title}  commented",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            subtitle:  Column(
              children: [
                Row(
                  children: [
                    Container(
                      constraints:
                                                                      BoxConstraints(
                                                                    maxWidth: MediaQuery.of(
                                                                                context)
                                                                            .size
                                                                            .width *
                                                                        0.65,
                                                                  ),
                      child: Text(
                          message,
                          style: GoogleFonts.rubik(fontSize: 17, color: Colors.grey),
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                
              ],
            ),
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width*.78,
                  height:0.7, color:Colors.black,

                ),
            ],
          )
        ],
      ),
    );
  }
}
