import "dart:convert";

import "package:flame/extensions.dart";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:http/http.dart" as http;

class usercircle extends StatefulWidget {
  const usercircle({
    Key? key, //String username, List<Map<String, dynamic>> userDataList

    required this.userDataList,
    required this.usernames,
    required this.token,
  }) : super(key: key);

  final List userDataList;
  final String token;
  final List usernames;
  @override
  State<usercircle> createState() => _usercircleState();
}

class _usercircleState extends State<usercircle> {
  var pic_url = [];
  Future getWeather3x() async {
    String token = widget.token.toString();
    // String id = widget.userid.toString();

    ////print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response picpic1 = await http
        .get(Uri.parse('https://afleet.co.ke/profpic/'), headers: headers);
    //var results = jsonDecode(responsev.body);
    var picpic = jsonDecode(picpic1.body);
    http.Response responsev = //http://172.16.12.17:8000/
        await http.get(Uri.parse('https://afleet.co.ke/unfo/'),
            headers: headers);

    var results = jsonDecode(responsev.body);

    setState(() {
      this.pic_url = picpic;
    });
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode(sharedPreferences.getString('pic_url')); //alredy passed here
    var passed2 = jsonDecode(sharedPreferences.getString('sky3'));
    var passeD3 = jsonDecode(sharedPreferences.getString('sky2'));
    var passed4 = jsonDecode(sharedPreferences.getString('sky'));
    var passed5 = sharedPreferences.getBool('ee7');
    var passed6 = sharedPreferences.getBool('ee8');

    setState(() {
      pic_url = passed;
    });
    getWeather3x();
  }

  @override
  /*
  Container(
    padding: EdgeInsets.all(8.0),
    child: Stack(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.grey,
          child: Center(
            child: Text(username.substring(0, 1)),
          ),
        ),
        ...uis
            .where((c) => c['username1'] == username)
            .map(
              (ui) => CircleAvatar(
                radius: 18,
                backgroundColor: Colors.cyan.shade600,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(ui['image'].toString()),
                ),
              ),
            )
            .toList(),
      ],
    ),
  );
   */
  Widget build(BuildContext context) {
    return Container(
    
      child: Stack(
        
        children: widget.userDataList
          
            .map((user) {
          return widget.usernames.reversed.where((af) => user['username1'] == af["writer"]).length > 5 ?Container(
    
            child: Row(
              children: [
                  ...widget.usernames.reversed.where((af) => user['username1'] == af["writer"]).take(4).toSet()
                  .toList().map((io)=>
    
                  /*
                  for (int i = 0; i < RandomImages.length; i++)
                  Align(
                    widthFactor: 0.5,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(RandomImages[i]),
                    ),
                  )
                  */
               SizedBox(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                         
                           Align(
                    widthFactor: 0.1,
                    child:CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.black,
                                
                      child: CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    NetworkImage(user['image'].replaceAll(" ", '')),
                              ),
                    )),
                          
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ):Container(
    
            child: Row(
              children: [
                  ...widget.usernames.reversed.where((af) => user['username1'] == af["writer"]).toSet()
                  .toList().map((io)=>
    
                  /*
                  for (int i = 0; i < RandomImages.length; i++)
                  Align(
                    widthFactor: 0.5,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(RandomImages[i]),
                    ),
                  )
                  */
                Container(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                         
                           Align(
                    widthFactor: 0.1,
                    child:CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.black,
                                
                      child: CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    NetworkImage(user['image'].replaceAll(" ", '')),
                              ),
                    )),
                          
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );

    ;
  }
}
