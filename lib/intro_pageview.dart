import 'package:OneStack/pages/profpichange.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class intrpage extends StatefulWidget {
  intrpage(
      {Key? key,
      required this.title,
      required this.token,
      required this.userid})
      : super(key: key);
  final String token;
  final String title;
  final String userid;

  @override
  State<intrpage> createState() => _intrpageState();
}

class _intrpageState extends State<intrpage> {
  int _currentIndex = 0;
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  var skilladd = [];
  var ID;
  var sky2;
  var pic_url ;
  var PassToken;
  int State = 0;
  var skilladd2 = [];
  bool actv = false;
  var Kcities = [
    "Nairobi",
    "Mombasa",
    "Nakuru",
    "Kisumu",
    "Kericho",
    "Bomet",
    "Machakos",
    "Baringo",
    "Busia",
    "Elgeyo Marakwet",
    "Embu",
    "Garissa",
    "Homa Bay",
    "Isiolo",
    "Kakamega",
    "Kajiado",
    "Kiambu",
    "Kisii",
    "Kitui",
    "Laikipia",
    "Lamu",
    "Makueni",
    "Mandera",
    "Meru",
    "Migori",
    "Mombasa",
    "Nakuru",
    "Narok",
    "Nyamira",
    "Nyandarua",
    "Samburu",
    "Siaya",
    "Tana River",
    "Taita Taveta",
    "Turkana",
    "Uasin Gishu",
    "Wajir",
  ];
  Future getMe() async {
    String token = widget.token.toString();
    String id = widget.userid.toString();

    print('here' + token);
    print('here' + id);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };

    http.Response responsev = await http
        .get(Uri.parse('https://afleet.co.ke/meff/$id'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    http.Response picpic1 = await http
        .get(Uri.parse('https://afleet.co.ke/profpic/'), headers: headers);
    //var results = jsonDecode(responsev.body);
    var picpic = jsonDecode(picpic1.body);
    setState(() {
      this.sky2 = xcv;
      this.pic_url = picpic;
    });
    //print(sky2);
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var passed = sharedPreferences.getString('passed'); //alredy passed here
    //var idk = sharedPreferences.getString('key');
    //var idk = sharedPreferences.getString('key');

    setState(() {
      PassToken = passed;
    });
    print('another one' + PassToken);
    print('another tw' + ID);
  }

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('passed', "passed");
  }

  getimage(username) {
    var filteredElements = pic_url.length == 0
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
        : pic_url
            .where((c) => c['username1'] == username.toString())
            .toList()
            .map((e) => e['image']);
    //print(filteredElements);
    return filteredElements
        .toString(); //.toString().replaceAll("[", "").replaceAll("]", "").split(",")
  }

  Future create1() async {
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/unfo/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': sky2["username"],
        'location': titleController2.text,
        'skills': skilladd.toString(),
        'likes': skilladd2.toString(),
      }),
    );

    //works => print(token['token']);

    var token = jsonDecode(response1.body);

    print(token);
    print(response1.statusCode);
    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
      //usercorrecion = response1.body;
    });
    //var token = jsonDecode(response1.body);
  }

  final List skills = [
    " HTML",
    "CSS",
    "JavaScript",
    "KCSE",
    "Math",
    "Kiswahili",
    "Databases",
    "Back-end development",
    "Front-end development",
    "Version control",
    "Testing",
    "Deployment",
    "Security",
    "Python",
    "JavaScript",
    "Java",
    "C#",
    "C++",
    "Swift",
    "R",
    "cooking",
    "Ruby",
    "PHP",
    "Go",
    "Rust",
    "Flutter",
    "Django",
    "AI",
    "BlockChain",
    "Cloud Computing",
    "GitHub",
    "News",
    "Football",
    "Sports",
    "Cyber Security",
    "IT Support",
    'IOT',
    "Tech News",
    "Memes",
    "Laravel",
    "Rails",
    "Spring Boot",
    "Angular",
    "React",
    "Vue.js",
    "Creativity",
    "Technical skills",
    "Communication skills",
    "Problem-solving skills",
    "Attention to detail",
    "Collaboration skills",
    "analytics",
    'creativity',
    ' communication',
    'critical thinking',
    'design',
    'leadership',
    'problem solving',
    'research',
    'sales',
    "Analytical thinking",
    "Problem solving",
    "Decision making",
    "Communication",
    "Leadership",
    "Teamwork",
    "Attention to detail",
    "Data analysis",
    "Financial modeling",
    "Investment analysis",
    "forex",
    "Law",
    "Kenyan Law",
  ];
  final PageController _pageController = PageController();
  @override
  void initState() {
    getMe();
    getValidation().whenComplete(() {
      PassToken != null && widget.title != "addnew"
          ? Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                          title: 'OneStack',
                          token: widget.token,
                          userid: widget.userid)));
            })
          : '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return sky2 == null&& pic_url == null?Scaffold(
      backgroundColor: Colors.grey[900],
      body:Center(
      child:CircularProgressIndicator()
    )):Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 120,
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    _currentIndex == 0
                        ? Container(
                            //0
                            height: 10,
                            width: MediaQuery.of(context).size.width * .23,
                            decoration: BoxDecoration(
                              color: Colors.cyan.shade900,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )
                        : Container(
                            //0
                            height: 8,
                            width: MediaQuery.of(context).size.width * .23,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                    _currentIndex == 1
                        ? Container(
                            //0
                            height: 10,
                            width: MediaQuery.of(context).size.width * .23,
                            decoration: BoxDecoration(
                              color: Colors.cyan.shade900,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )
                        : Container(
                            height: 8,
                            width: MediaQuery.of(context).size.width * .23,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                    _currentIndex == 2
                        ? Container(
                            //0
                            height: 10,
                            width: MediaQuery.of(context).size.width * .23,
                            decoration: BoxDecoration(
                              color: Colors.cyan.shade900,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )
                        : Container(
                            height: 8,
                            width: MediaQuery.of(context).size.width * .23,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                    _currentIndex == 3
                        ? Container(
                            //0
                            height: 10,
                            width: MediaQuery.of(context).size.width * .23,
                            decoration: BoxDecoration(
                              color: Colors.cyan.shade900,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )
                        : Container(
                            height: 8,
                            width: MediaQuery.of(context).size.width * .23,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                  ])),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .8,
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .8,
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Text(
                            "Heey! 👋\nLet's Build your Profile ",
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                          Container(height: 50),
                          InkWell(
                            
                            child: Container(
                              width: 100,
                              child: Center(
                                  child: Stack(children: [
                                InkWell(
                                  onTap: () {
                              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => chang(
                            
                            username: sky2["username"].toString()
                          )));
                            },
                                  child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.grey,
                                      child: Center(
                                        child:Icon(Icons.person,color:Colors.blueGrey.shade900),
                                      )),
                                ),
                                ...pic_url.map(
                                  (ui) => ui['username1'] ==
                                          sky2["username"].toString()
                                      ? Center(
                                          //bottom:0,
                                          child: InkWell(
                                            onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => chang(
                            
                            username: sky2["username"].toString()
                          )));},
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundColor: Colors.transparent,
                          
                                              backgroundImage: NetworkImage(
                                                ui['image'],
                                              ), //ui['image'],
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          //ui['image'],
                                          ),
                                ),
                                Positioned(
                                  bottom: 2,
                                  right: 6,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.grey.shade900,
                                      radius: 9,
                                      child:
                                          const Icon(Icons.camera_alt, size: 10)),
                                )
                              ])),
                            ),
                          ),
                          Container(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.all(18.0),
                            child: //Row(children: [
                                Center(
                              child: Text(
                                "Click on Continue to get Started", //changed
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(height: 105),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .85,
                            decoration: BoxDecoration(
                                color: Colors.cyan.shade600,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              onPressed: () {
                                setState(() {
                                  _currentIndex = 1;
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                });

                                //print(State);
                              },
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .8,
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Container(
                              child: Row(children: [
                            Text(
                              "I live in ",
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ])),
                          Container(height: 80),
                          Container(
                            padding: EdgeInsets.all(18.0),
                            child: Row(children: [
                              Text(
                                "Your city/county", //changed
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: Colors.white),
                              ),
                            ]),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: titleController2,
                              decoration: InputDecoration(
                                enabled: false,
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: Colors.white,
                                ),
                                filled: true,
                                //fillColor: ,
                                fillColor: Colors.blueGrey[900],
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                //labelText: 'Username',
                                hintText: 'Enter your city/county',

                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                              height: 255,
                              color: Colors.black.withOpacity(0.4),
                              child: SingleChildScrollView(
                                  child: Column(
                                children: [
                                  ...Kcities.map(
                                    (e) => InkWell(
                                      onTap: () {
                                        setState(() {
                                        titleController2.text = e.toString();
                                         
                                        });
                                       },
                                      child: ListTile(
                                        title: Text(
                                          e.toString(),
                                          style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.grey,
                                        ),
                                        subtitle: Text(
                                          "Kenya",
                                          style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                          Container(
                            padding: EdgeInsets.all(18.0),
                            child: Row(children: [
                              Text(
                                "", //changed
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: Colors.white),
                              ),
                            ]),
                          ),
                          titleController2.text != ''
                              ? Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan.shade600,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = 1;
                                        _pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut);
                                      });

                                      //print(State);
                                    },
                                  ),
                                )
                              : Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.cyan.shade50.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.1),
                                          fontSize: 25),
                                    ),
                                    onPressed: () {
                                      //print(State);
                                    },
                                  ),
                                ),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(15.0),
                      height: MediaQuery.of(context).size.height * .8,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        bottomNavigationBar: Container(
                          child: skilladd.length >= 5
                              ? Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan.shade600,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = 2;
                                        _pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut);
                                      });

                                      //print(State);
                                    },
                                  ),
                                )
                              : Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.cyan.shade50.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.1),
                                          fontSize: 25),
                                    ),
                                    onPressed: () {
                                      //print(State);
                                    },
                                  ),
                                ),
                        ),
                        body: Container(
                          color: Colors.grey.shade900,
                          child: SingleChildScrollView(
                            child:
                                Wrap(spacing: 10.0, runSpacing: 5.0, children: [
                              ListTile(
                                title: Text(
                                  "Choose your Topics", //changed
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  "This helps us recommend you with things you like (Pick atleast 5)", //changed
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                height: 10,
                              ),
                              ...skills.map((e) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        skilladd.add(e);
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor: skilladd.contains(e)
                                          ? Colors.cyan.shade600
                                          : Colors.grey,
                                      label: Text(
                                        e, //changed
                                        style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ))
                            ]),
                          ),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.all(15.0),
                      height: MediaQuery.of(context).size.height * .8,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        bottomNavigationBar: Container(
                          child: skilladd2.length >= 5
                              ? Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan.shade600,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                    child: Text(
                                      'Complete',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = 3;

                                        inm();

                                        create1();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyHomePage(
                                                        title: 'Verf',
                                                        token: widget.token,
                                                        userid:
                                                            widget.userid)));
                                      });

                                      //print(State);
                                    },
                                  ),
                                )
                              : Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.cyan.shade50.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                    child: Text(
                                      'Complete',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.1),
                                          fontSize: 25),
                                    ),
                                    onPressed: () {
                                      //print(State);
                                    },
                                  ),
                                ),
                        ),
                        body: Container(
                          color: Colors.grey.shade900,
                          child: SingleChildScrollView(
                            child:
                                Wrap(spacing: 10.0, runSpacing: 5.0, children: [
                              ListTile(
                                title: Text(
                                  "I'm currently learning", //changed
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  "This helps us recommend you with like-minded people (Pick atleast 5)", //changed
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                height: 10,
                              ),
                              ...skills.map((e) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        skilladd2.add(e);
                                      });
                                    },
                                    child: Chip(
                                      backgroundColor: skilladd2.contains(e)
                                          ? Colors.cyan.shade600
                                          : Colors.grey,
                                      label: Text(
                                        e, //changed
                                        style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ))
                            ]),
                          ),
                        ),
                      )),
                ],
              ),
            )
          ]),
        ));
  }
}
