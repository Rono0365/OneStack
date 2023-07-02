import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class eventwidget extends StatefulWidget {
  eventwidget({
    Key? key,
    required this.eventowner,
    required this.eventtitle,
    required this.eventpic,
    required this.eventloc,
    required this.eventdate,
    required this.numb,
  }) : super(key: key);
  final String eventowner;
  final String eventtitle;
  final List eventpic;
  final String eventdate;//eventloc
  final String eventloc;
  final int numb;
  
  

  @override
  State<eventwidget> createState() => _eventwidgetState();
}

class _eventwidgetState extends State<eventwidget> {
   final List<Color> colors2 = <Color>[
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow.shade900,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow.shade900,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow.shade900,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow.shade900,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow.shade900,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow.shade900,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow.shade900,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow.shade900,
    Colors.pink,
    Colors.cyan,
    Colors.lightBlue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow.shade900,
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
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:7.0,left: 8.0,right:8.0
      ),
      child: Container(
        decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(10.0)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                colors[widget.numb],
                colors2[widget.numb].withOpacity(0.8),
                colors2[widget.numb].withOpacity(0.8),
                colors2[widget.numb].withOpacity(1.0)
              ],
              stops: const [0.1, 0.6,0.8, 1],
            ),
          ),
        child: Card(
          elevation: 0,
            color: Colors.transparent,//colors2[widget.numb],
            child: Column(
              children: [
                Container(
                  //height: 100,
                  child: ListTile(
                    title: Text(
                      widget.eventtitle.toString(),
                      style: GoogleFonts.rubik(
                          color: Colors.grey.shade50,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),textAlign:TextAlign.start
                    ),
                    
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(children:[
                                  CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey,
                                  child: null,
                                ),
                                ...widget.eventpic
                          .where((c) => c['username1'] == widget.eventowner.toString())
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
                                Container(
                                  width: 13,
                                ),
                                Text(
                                  "${widget.eventowner}",
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          
                              Container(
                                width: MediaQuery.of(context).size.width * .8,
                                child:ListTile( title:Text(
                                  "${widget.eventtitle}",
                                  style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 19),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Row(children: [
                                  Icon(Icons.location_on,color: Colors.red,size: 15,),
                                  Text(
                        widget.eventloc.toString(),
                        style: GoogleFonts.rubik(
                            color: Colors.grey,
                            //fontWeight: FontWeight.bold,
                            //fontSize: 25
                            ),
                                       ),])
                                )
                              ),
                            //]),
                          
                          Row(children: [
                            Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Chip(label: Text("${widget.eventdate}")))
                          ]),
                          Container(
                            height: 0.5,
                            width: MediaQuery.of(context).size.width * .95,
                            color: Colors.grey,
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child:
                                      Stack(clipBehavior: Clip.none, children: [
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
                                ),
                                Container(
                                  width: 19,
                                ),
                                Text(
                                  "90 people",
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
