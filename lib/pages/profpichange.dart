import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

class chang extends StatefulWidget {
  chang(
      {Key? key,
      required this.username,
      required this.mode,
      required this.lang2})
      : super(key: key);
  String username;
  String lang2;
  bool mode;

  @override
  State<chang> createState() => _changState();
}

class _changState extends State<chang> {
  var image;
  var stuff;
  var net;
  bool chosen = false;
  var chosen1;
  var met;
  Future createpic() async {
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/profpic/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'username1': widget.username,
        'image': chosen1.toString(),
      }),
    );
    http.Response response2 = await http.post(
      Uri.parse('https://afleet.co.ke/profpic/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'username1': widget.username,
        'image': chosen1.toString(),
      }),
    );
    ////print(jsonDecode(response1.data.toString()) );
    //works => //print(token['token']);
    //print(jsonDecode(response2.body.toString()));

    //print(jsonDecode(response1.body.toString()));
    if (response1.statusCode == 201) {
      //print("yea it happened");
      //print(jsonDecode(response1.body.toString()));
    }
    ;

    //});
//save the token for next time
  }

  Future getMe() async {
    http.Response responsev =
        await http.get(Uri.parse('https://afleet.co.ke/pics/'));
    var xcv = jsonDecode(responsev.body);
    setState(() {
      this.net = xcv;
      //here you'll get the value of the username
      //the usernbame is unique thus you can use it as nany user driver// teacher // student
      // value = sky2;
    });
    ////print(sky2);
  }

  @override
  void initState() {
    getMe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // color: Colors.black,
                child: Image.network(
                  !chosen
                      ? "https://images.unsplash.com/photo-1594671581654-cc7ed83167bb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3lhbiU1Q3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"
                      : chosen1.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(1.0)
                        ],
                        stops: const [0.1, 0.6, 1],
                      ),
                    ),
                    child: null),
              ),
            ],
          ), //ui['image'],
        ),
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
                widget.lang2 != "Kiswahili (🇰🇪)"
                    ? "Choose your Profpic"
                    : "Chagua FitCon Lako",
                style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)),
            //backgroundColor: Colors,
          ),
          body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 10),
              SizedBox(height: 20),
              net == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          ...net.map((i) => CircleAvatar(
                                radius: 60, //determine chosen
                                backgroundColor: chosen1 == i['image']
                                    ? Colors.cyan.shade600
                                    : Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      chosen1 = i['image'];
                                      chosen = true;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      i['image'],
                                    ),
                                    radius: 55,
                                    //child: Image.network(i['image'],fit:BoxFit.fill),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
              ListTile(),
              ListTile()
            ]),
          ),
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(1.0)
                ],
                stops: const [0.1, 0.6, 1],
              ),
            ),
            child: Center(
              child: chosen
                  ? FloatingActionButton.extended(
                      elevation: 0,
                      onPressed: () {
                        createpic();
                        const snackBar = SnackBar(
                          content: Text("Changing in a few"),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      backgroundColor:
                          chosen ? Colors.cyan.shade600 : Colors.black12,
                      label: Text(widget.lang2 != "Kiswahili (🇰🇪)"
                          ? "Update"
                          : "sahihisha"))
                  : SizedBox(),
            ),
          ),
          //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          //floatingActionButton:
        ),
      ],
    );
  }
}
