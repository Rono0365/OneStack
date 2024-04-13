import 'package:OneStack/posts/post2club.dart';
import 'package:OneStack/posts/postoclub.dart';
import 'package:OneStack/verifynow/verify2.dart';
import 'package:OneStack/verifynow/verifyservice.dart';
import 'package:OneStack/widgets/clubwidget.dart';
import 'package:OneStack/widgets/widget1.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class clubZ extends StatefulWidget {
  const clubZ({
    Key? key,
    required this.kala,
    required this.username,
    required this.title,
    required this.token,
    required this.information,
    required this.pics,
    required this.sky3,
  }) : super(key: key);
  final Color kala;
  final String username;
  final String title;
  final List information;
  final List sky3;
  final String token;
  final List pics;
  @override
  State<clubZ> createState() => _clubZState();
}

class _clubZState extends State<clubZ> {
  var _textSize = 17.0;
  bool onselect = false;
   final audioCache = AudioCache();
  @override
  void initState() {
    super.initState();
   
    audioCache.load('assets/postsmth.mp3');
    audioCache.load('assets/sendsmth.mp3');
    // retrieveRooms();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Container(
            color: widget.kala,
          ),
        ),
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.black.withOpacity(0.9),
          bottomNavigationBar: Container(
            height: 50,
            color: Colors.transparent,
          ),
          floatingActionButton:
              FloatingActionButton(onPressed: () {
showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      //  sum = 0;
                                      //var given_list = [1, 2, 3, 4, 5];

                                      return post2R(
                                          name: widget.username,
                                          image: widget.pics,
                                          token:widget.token,
                                          title: widget.title
                                          ,
                                          );
                                    });

              }, child: Icon(Icons.create)),
          body: RefreshIndicator(
                                onRefresh: () async {
                                  
                                   audioCache.play('postsmth.mp3');

                                  // offnd();
                                  //Do whatever you want on refrsh.Usually update the date of the listview
                                },
                                child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(),
                  ListTile(
                   title:Container(
                     child: Row(
                       children: [
                        SizedBox(),
                         Container(
                          padding: EdgeInsets.all(3.0),
                          
                          decoration: BoxDecoration(
                            color: Colors.black,
                           borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                           child: Row(children: [
                                           /*Container(
                            //padding: EdgeInsets.only(),
                                           height: 40,//MediaQuery.of(context).size.width * 0.13,
                                           width: 40,//MediaQuery.of(context).size.width * 0.13,
                                           child: Image.asset('assets/icon1.png'),
                                         ),*/
                                           Text(
                            "One",
                            style: GoogleFonts.inconsolata(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                                           ),
                                           Text(
                            "Stack ",
                            style: GoogleFonts.inconsolata(
                              fontSize: 24,
                              color: Colors.cyan.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                                           )
                                         ]),
                         ),
                       ],
                     ),
                   ),
                    trailing: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width:15),

                          Container(
                  child: Stack(children: [
                    CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: Center(
                          child:
                              Text(widget.username.toString().substring(0, 1)),
                        ),
                      
                    ),
                    ...widget.pics == null
                        ? [
                            {
                              "id": 126,
                              "username1": "RonoRet",
                              "image":
                                  "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                            },
                            {
                              "id": 127,
                              "username1": "RetRono",
                              "image":
                                  "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                            }
                          ]
                            .where((c) =>
                                c['username1'] == widget.username.toString())
                            .map(
                              (ui) =>  CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.transparent,

                                  backgroundImage: NetworkImage(
                                    ui['image'].toString(),
                                  ), //ui['image'],
                                ),
                              
                            )
                        : widget.pics
                            .where((c) =>
                                c['username1'] == widget.username.toString())
                            .map(
                              (ui) =>  CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.transparent,

                                  backgroundImage: NetworkImage(
                                    ui['image'].replaceAll(" ", ''),
                                  ), //ui['image'],
                                
                              ),
                            ),
                  ]),
                ),
                        ],
                      ),
                    ),
                  ),
                  onselect
                      ? Container(
                          height: 50,
                          color: onselect?Colors.blueGrey.shade900: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(children: [
                                  Slider(
                                    value: _textSize,
                                    min: 12.0,
                                    max: 25.0,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _textSize = newValue;
                                      });
                                    },
                                  ),
                                  Text(
                                    "${_textSize.round()}",
                                    style: TextStyle(
                                        fontSize: _textSize, color: Colors.white),
                                  ),
                                ]),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                     onselect = false;  
                                    });
                                   
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Select",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      : SizedBox(),
                  ListTile(
                    title: Container(
                      padding: EdgeInsets.only(left: 4),
                      child: verifyme2(username: "${widget.title}", token: "")),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * .8,
                      color: Colors.transparent,
                      child: RefreshIndicator(
                                onRefresh: () async {
                                  
                                   audioCache.play('postsmth.mp3');

                                  // offnd();
                                  //Do whatever you want on refrsh.Usually update the date of the listview
                                },
                                child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...widget.information.map((x) => x["whoiswho"].toString().replaceAll(" ","") ==
                                      widget.title.toString().replaceAll(" ","")
                                  ? 
                                  
                                  /*
                                  time1:
                                                "${x["date"].split("|")[0].split(" ")[1].toString()} "
                                                "${x["date"].split("|")[0].split(" ")[2]}",
                                            time2: x["date"].toString(),
                                            name: x["writer"],
                                            title: x["mation"],
                                            chip: x["whoiswho"].toString(),
                                       postdata:information,
                                       peoplex: information
                                                        .map((u) =>
                                                            u['title'].contains('message') &&
                                                            u['whoiswho'] ==
                                                                x['id']
                                                                    .toString())
                                                        .toSet()
                                                        .toList()
                                                        .map((c) {})
                                                        .length ==
                                                    1
                                                ? []
                                                : information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString()).toList()
                                                    ,     
                                            people: information
                                                        .map((u) =>
                                                            u['title'].contains('message') &&
                                                            u['whoiswho'] ==
                                                                x['id']
                                                                    .toString())
                                                        .toSet()
                                                        .toList()
                                                        .map((c) {})
                                                        .length ==
                                                    1
                                                ? ""
                                                : information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .length
                                                    .toString(),
                                            Id: x["id"].toString(),
                                            token: widget.token,
                                            myusername: widget.username.toString(),
                                            image: widget.pic_url, text: ''
                                  */
                                  homewidget(
                                      time1: "${x["date"].split("|")[0].split(" ")[1].toString()} "
                                                "${x["date"].split("|")[0].split(" ")[2]}",
                                      text: '',
                                      time2: "${x["date"]}",
                                      name: x["writer"],
                                      title: x["mation"],
                                      imagez: x["image"],
                                           
                                                    imagez1: x["image1"],
                                                     imagez2: x["image2"],
                                                      imagez3: x["image3"],
                                                      
                                      postdata: widget.information,
                                      //textsize: _textSize.toInt(),//_textSize.round()
                                      chip: x["whoiswho"].toString(),
                                      peoplex: widget.information
                                                        .map((u) =>
                                                            u['title'].contains('message') &&
                                                            u['whoiswho'] ==
                                                                x['id']
                                                                    .toString())
                                                        .toSet()
                                                        .toList()
                                                        .map((c) {})
                                                        .length ==
                                                    1
                                                ? []
                                                : widget.information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString()).toList()
                                                    ,     
                                      people: widget.information
                                                  .map((u) =>
                                                      u['title']
                                                          .contains('message') &&
                                                      u['whoiswho'] ==
                                                          x['id'].toString())
                                                  .toSet()
                                                  .toList()
                                                  .map((c) {})
                                                  .length ==
                                              1
                                          ? ""
                                          : widget.information
                                              .where((u) =>
                                                  u['title'].contains('message') &&
                                                  u['whoiswho'] == x['id'].toString())
                                              .length
                                              .toString(),
                                      Id: x["id"].toString(),
                                      token: widget.token,
                                      myusername: widget.username.toString(),
                                      image: widget.pics)
                                  : SizedBox()),
                                  ListTile(),
                            ListTile()
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
