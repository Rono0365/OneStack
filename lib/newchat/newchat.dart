import 'package:OneStack/verifynow/verifyservice.dart';
import 'package:OneStack/widgets/chatnode.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:intl/intl.dart';

import '../widgets/chatnode2.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreen({
    Key? key,
    required this.pic_url,
    required this.mUsername,
    required this.ouser,
  }) : super(key: key);

  final List pic_url;
  final String mUsername;
  final String ouser;

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final audioCache = AudioCache();

  List<String> rooms = [];
  var messages = [];
  var messages2 = [];
  var messagesz = [];
  final texts = TextEditingController();
  String currentuser = '';
  
  //String newRoomName = '';
  //String mUsername = "RetRono";
  String newMessage = '';
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    //openx();
    retrievep(widget.mUsername);
    retrieveMessages('${widget.ouser}');

    audioCache.load('assets/postsmth.mp3');
    audioCache.load('assets/sendsmth.mp3');

    // retrieveRooms();
  }

  void retrieveRooms2() async {
    final url = Uri.parse(
        'https://onestack-verfchat.onrender.com/messages/${widget.mUsername}');
    final response = await http.get(url);

    final data = json.decode(response.body);
    final roomList = data['message'] as List;
    setState(() {
      messages2 = roomList;
    });
  }

  retrievep(String me) async {
    final url =
        Uri.parse('https://onestack-verfchat.onrender.com/messages/${me}');
    final response = await http.get(url);

    final data = json.decode(response.body);
    final roomList = data['messages'];
    if (roomList.length > messagesz.length) {
      setState(() {
        messagesz = roomList;
        audioCache.play('postsmth.mp3');
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent * 105,
          duration: Duration(milliseconds: 3),
          curve: Curves.easeOut,
        );
      });
      //print('New data received. Updated messagesz: ' + messagesz.toString());

      ////print('this is z' + messagesz.toString());
    }
    //return messagesz != null ? messagesz.toList() : [];
  }

  void retrieveRooms() async {
    final url = Uri.parse(
        'https://onestack-verfchat.onrender.com/messages/${widget.ouser}');
    final response = await http.get(url);
    retrievep(widget.mUsername);

    final data = json.decode(response.body);
    final roomList = data['message'] as List<String>;
    setState(() {
      messages = roomList;
    });
  }

  /*void createRoom() async {
    final url = Uri.parse('http://onestack-verfchat.onrender.com/${newRoomName}');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'name': newRoomName});
    retrievep("${newRoomName}");

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      setState(() {
        rooms.add(newRoomName);sendMessage.60        newRoomName = '';
      });
    } else {
      //print('Error occurred while creating room: ${response.body}');
    }
  }*/

  void openx() async {
    retrieveRooms();
    retrievep(widget.mUsername);
    retrieveRooms2();
    //retrieveMessages('${widget.ouser}');
  }

  void sendMessage() async {
     DateFormat formatter = DateFormat('hh:mm a');
    DateTime parsedTime = formatter.parse('12:30 PM');
    
  int timestamp = parsedTime.millisecondsSinceEpoch;
    http.Response response = await http.post(
      Uri.parse('https://onestack-verfchat.onrender.com/${widget.ouser}'),
      body: {
        "message": texts.text,
        "writerName": widget.mUsername,
       
      },
    );

    audioCache.play('sendsmth.mp3');
    retrieveRooms();
    retrievep(widget.mUsername);
    retrieveRooms2();
    retrieveMessages('${widget.ouser}');
    setState(() {
      newMessage = '';
      texts.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 3),
        curve: Curves.easeOut,
      );
    });
  }

  Future retrieveMessages(String room) async {
    final url =
        Uri.parse('https://onestack-verfchat.onrender.com/messages/${room}');
    final response = await http.get(url);

    final data = json.decode(response.body);
    final messageList = data['messages']; //
    setState(() {
      messages = messageList;
      //print("this point" + messages.toString());
      retrievep(widget.mUsername);
    });
  }

  getme(String qx) {
    final x = messages;
    final x2 = messagesz != null ? messagesz : [];
    // final v = x.last;

    final mess = x.map((z) => z[1]);

    final list_of_mes = mess.where(
        (x1) => x1[0] == "${widget.mUsername}"); //here get the righth users
    return list_of_mes.toList();
  }

  getme2(String qx) {
    retrievep(widget.mUsername);
    final x2 = messagesz != null ? messagesz : [];
    // final v = x.last;
    final mess2 = x2.map((z) => z[1]);
    //final mess = x.map((z)=>z[1]);
    final list_of_mes2 = mess2.where((x1) => x1[0] == "${widget.ouser}");
    //final list_of_mes= mess.where((x1)=>x1[0] == "RetRono");//here get the righth users
    return list_of_mes2.toList();
  }

  combineAndSortLists() {
    List combinedList = [...getme(""), ...getme2("")];
    //combinedList.sort();
    combinedList.sort((a, b) => a[2].compareTo(b[2])); //worked
    return combinedList != null ? combinedList : [];
  }

  @override
  Widget build(BuildContext context) {
    retrievep(widget.mUsername);
    retrieveMessages('${widget.ouser}');
    //retrievep('${widget.ouser}');
    //retrieveMessages('${widget.ouser}');
    return Scaffold(
      backgroundColor: Colors.grey.shade900,

      body: Column(
        children: [
          ListTile(),
          ListTile(
              leading: Container(
                child: Stack(children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey,
                    child: Center(
                      child: Text(widget.ouser.toString().substring(0, 1)),
                    ),
                  ),
                  ...widget.pic_url == null
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
                        ].where((c) => c['username1'] == "room".toString()).map(
                            (ui) => CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.transparent,

                              backgroundImage: NetworkImage(
                                ui['image'].toString(),
                              ), //ui['image'],
                            ),
                          )
                      : widget.pic_url
                          .where(
                              (c) => c['username1'] == widget.ouser.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.transparent,

                              backgroundImage: NetworkImage(
                                ui['image'],
                              ), //ui['image'],
                            ),
                          ),
                ]),
              ),
              title: verifyme(
                username: widget.ouser,
                token: "",
              ),
              trailing: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: Colors.white))),
          //["RetRono","qqih","7/17/2023, 11:07:38 PM"]
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height*.7,
              child: ListView(
                controller: _scrollController,
                children: [
                  ...combineAndSortLists()
                      .map((o) => o[0].toString() == widget.mUsername
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ChatBubble2(
                                      username: o[0].toString(),
                                      timeframe: o[2].toString(),
                                      message: o[1].toString(),
                                      pics: widget.pic_url,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ChatBubble(
                                username: o[0].toString(),
                                timeframe: o[2].toString(),
                                message: o[1].toString(),
                                pics: widget.pic_url,
                              ),
                            )),
                  ListTile(),
                  ListTile()
                ],
              ),
            ),
          ),

          // Text(combineAndSortLists().toString()),
          Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                //borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.all(7),
                  //height: 50,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Container(
                    //color: Colors.blueGrey[900],
                    child: TextField(
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      maxLines: null,
                      controller: texts,

                      onChanged: (value) {
                        newMessage = value;

                        enabled:
                        false;
                      },
                      style: TextStyle(color: Colors.grey[100]),
                      //void man => value.toString();

                      decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.storefront),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.grey[50]),
                          fillColor: Colors.grey[900],
                          hintText: 'Enter a message...',
                          hintStyle: TextStyle(color: Colors.grey[50]),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => sendMessage(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      sendMessage();
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 3),
                        curve: Curves.easeOut,
                      );
                      texts.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ])),
        ],
      ),

      // bottomNavigationBar:
      /* drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Create Room'),
              subtitle: TextField(
                decoration: InputDecoration(hintText: 'Enter room name'),
                onChanged: (value) {
                  setState(() {
                    newRoomName = value;
                  });
                },
              ),
              trailing: IconButton(
                onPressed: createRoom,
                icon: Icon(Icons.add),
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Rooms'),
            ),
            ...rooms.map((room) => ListTile(
                  title: Text(room),
                  onTap: () {
                    setState(() {
                      widget.ouser = room;
                    });
                    retrieveMessages(room);
                    retrieveRooms2();
                    Navigator.pop(context);
                  },
                )),
          ],
        ),
      ),*/
    );
  }
}
