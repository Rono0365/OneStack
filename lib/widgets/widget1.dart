import 'package:OneStack/compchat/comments.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homewidget extends StatefulWidget {
  homewidget(
      {Key? key,
      required this.name,
      required this.title,
      required this.Id,
      required this.chip,
      required this.token,
      required this.people,
      required this.image,
      required this.time1,
      required this.myusername,
      required this.time2})
      : super(key: key);

  final String name;
  final String myusername;
  final String title;
  final String chip;
  final String people;
  final String Id;
  final String token;
  final List image;
  final String time1;
  final String time2;

  @override
  State<homewidget> createState() => _homewidgetState();
}

class _homewidgetState extends State<homewidget> {
  @override
  Widget build(BuildContext context) {
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
      onTap: (){
    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  FriendMess3(
    
     title:widget.Id,//id of the chat
   
   token: widget.token
    , //randombla
    myname:"onestack", //class teacher
    user:widget.myusername, //class
  )));
      },      child: Container(
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
                          .where((c) => c['username1'] == widget.name.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 22,
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
                  title: Text(
                    widget.name,
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                  subtitle: Text(
                    "@${widget.time2}",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.normal,
                        color: Colors.blueGrey.shade900),
                  ),
                  trailing: Container(
                    width: 60,
                    child: Row(
                      children: [
                        Text(
                          "${widget.time1}",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.normal, color: Colors.grey),
                        ),
                        Text(" "),
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.redAccent,
                        )
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
                  child: Text(
                    widget.title.toString(),
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                    //overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  height: 3,
                ),
                Row(children: [
                  Container(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Chip(label: Text(widget.chip,style: GoogleFonts.rubik(
                              fontWeight: FontWeight.normal,))))
                ]), //chip
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width * .95,
                  color: Colors.grey,
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                 widget.people != ""
                            ?  int.parse(widget.people) >1?    Container(
                        child: Stack(clipBehavior: Clip.none, children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey,
                            child: null,
                          ),
                          Positioned(
                            right: -3,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.black,
                              child: null,
                            ),
                          ),
                          Positioned(
                            right: -7,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              child: null,
                            ),
                          ),
                          Positioned(
                            right: -12,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.black,
                              child: null,
                            ),
                          ),
                          Positioned(
                            right: -16,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              child: null,
                            ),
                          )
                        ]),
                      ): CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey,
                            child: null,
                          ):SizedBox(),
                      Container(
                        width: 19,
                      ),
                      Text(
                        widget.people != ""
                            ? int.parse(widget.people) >1?"${widget.people} comments":"${widget.people} comment"
                            : "",
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
