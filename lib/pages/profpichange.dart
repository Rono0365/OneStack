import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

class chang extends StatefulWidget {
  chang({Key? key, required this.username}) : super(key: key);
  String username;

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
    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);
    print(jsonDecode(response2.body.toString()));

    print(jsonDecode(response1.body.toString()));
    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
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
    //print(sky2);
  }

  @override
  void initState() {
    getMe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 10),
          Text("Choose your FleetCon",
              style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
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
                                ? Colors.deepPurple
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
        ]),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Center(
          child: FloatingActionButton.extended(
            elevation: 0,
            onPressed: () {

              createpic();
              const snackBar = SnackBar(
                                  content: Text(
                                      "Changing in a few"),
                                );
    
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
              Navigator.pop(context);
             // Navigator.pop(context);
            },
            backgroundColor: chosen ? Colors.deepPurple : Colors.black12,
            label: Text("Update")),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //floatingActionButton: 
    );
  }
}
