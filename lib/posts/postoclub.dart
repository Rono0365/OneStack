import 'package:OneStack/verifynow/verify2.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../postanimage/post1.dart';
import '../verifynow/verifyservice.dart';

class postM extends StatefulWidget {
  postM(
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
  State<postM> createState() => _postMState();
}

class _postMState extends State<postM> {
  String imageBase64 = '';
  File? image;
  File? image2;
  File? image3;
  File? image4;
  Future pickImage() async {
    final imagePicker = ImagePicker( );
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery
        ,
        imageQuality: 25,
       
        );

    if (pickedImage == null) {
      return;
    }

   

    setState(() async{
       image = File(pickedImage.path);
    final List<int> imageBytes = await image!.readAsBytes();
    imageBase64 = base64Encode(imageBytes);
    });
  }

  final audioCache = AudioCache();

  var now; //(String now) {}
  var leo;
  final titleController = TextEditingController();
  //C:\Users\Win 10 Pro\verf\verf\android\app\src\main\res\mipmap-xxxhdpi\ic_launcher.png
  var dearMrFantastic2;
  var dearMrFantastic =
      "Myself"; //= widget.topics.toString().replaceAll("]", "").replaceAll(" ", "").replaceAll("[", "").split(",")[0];
  Future createPost() async {
    //print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/information/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'whoiswho': dearMrFantastic2,
        'title': "mop", //an actual title
        'writer': widget.name, //class teacher
        'mation':  titleController.text ,
        'image':  image!= null?"${imageBase64}":"notitle",
        'to': dearMrFantastic2, //[${er['name']},${er['school']}]
        'date': now.toString() + '|' + leo.toString(),
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
  void initState() {
    super.initState();
 setState(() {
                              //DateFormat('EEEE').format(date);
      this.now = DateFormat('EEEE d MMM')
                                  .format(DateTime.now());
                              //returns json body from api
                              //this.courseblock = result1;
                              this.leo = DateFormat.jm().format(DateTime.now());
                            });
    audioCache.load('assets/postsmth.mp3');
    audioCache.load('assets/sendsmth.mp3');
    // retrieveRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: Container(height: 100,color:Colors.black),
      backgroundColor: Colors.grey.shade900,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          createPost();
          titleController.clear();
          audioCache.play('postsmth.mp3');
          Navigator.pop(
            context,
          );
        },
        child: Center(
          child: Transform.rotate(angle: -0.5, child: Icon(Ionicons.send)),
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
                 /* Container(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.black,
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
                  ),*/
                  Text("To:", style: TextStyle(color: Colors.white)),
                  DropdownButton(
                    dropdownColor: Colors.black,
                    value: '${dearMrFantastic}',
                    items: [
                      ...widget.topics
                          .toString()
                          .replaceAll("]", "")
                          .replaceAll("[", "")
                          .replaceAll(" ", "")
                        
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
                  )
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
                    backgroundColor: Colors.cyan.shade100,
                    child: Center(
                      child: Text(
                        widget.name.toString().substring(0, 1),
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan.shade600),
                      ),
                    ),
                  ),
                ),
                ...widget.image
                    .where((c) => c['username1'] == widget.name.toString())
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
            title: verifyme(
                username: widget.name.toString(), token: widget.token),
                subtitle: Text(leo.toString(),style:GoogleFonts.rubik(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 17)
                                
                                ),
                                trailing: image != null
                    ?Container(
                      width:100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Ionicons.add_circle, color: Colors.white),
                          Icon(Ionicons.image_outline, color: Colors.white),
                        ],
                      ),
                    ):SizedBox(),
                
                ),
                Row(
                  children: [
                    CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.transparent,
      
                          //ui['image'],
                        ),
                    Container(
                        //padding: EdgeInsets.only(left: 50.0),
                        //width: 350,
                                               constraints: BoxConstraints(maxHeight: 200.0, maxWidth: 350.0,),
                        height: 100,
                        child: ListView(
                          children: [
                            TextField(
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
                                      'Tap to Share your \nthoughts & Ideas...',
                                  hintStyle: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17)),
                              controller: titleController,
                            ),
                          ],
                        ),
                      
                    ),
                  ],
                ),
                image != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.file(
                                image!,
                                height: 250,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                right: 3,
                                top: 1,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                    image = null;
       
                                    });
                                                                       },
                                  child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.grey.shade900
                                          .withOpacity(0.3),
                                      child: const Icon(Icons.close,
                                          color: Colors.white)),
                                ))
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: [
                            Container(
                              child: InkWell(
                                onTap: pickImage,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Ionicons.image_outline,
                                          color: Colors.white),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
