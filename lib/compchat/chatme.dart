//caution this don't change anything here it will result 
//to a bug that will be hard to solve and end up screwing your retina
//i wrote this about 2 years ago so it's a long file
import 'dart:async';

import 'groupmess.dart';
import 'privmess.dart';
import 'search.dart';
import 'package:collection/collection.dart';
//import 'package:sort/sort.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'comments.dart';
import 'dart:math';
import 'mess.dart';
import 'package:intl/intl.dart';
import 'privatereply.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'groupmess.dart';

class communications extends StatefulWidget {
  communications(
      {Key? key,
      required this.username,
      required this.students,
      //required this.subs,
      //required this.title1,
      required this.kala1,
      required this.school,
      required this.profpic,
      required this.klass,
      required this.tr})
      : super(key: key); //klass
  //final List title1;
  final List students;
  final String klass;
  final String school;
  //final List subs;
  final bool kala1;
  final String tr;
  final String username;
  final List profpic;

  @override
  _communicationsState createState() => _communicationsState();
}

class _communicationsState extends State<communications> {
  var info3;
  var lama;
  var now;
  var verified;
  //var online;
  final titleController = TextEditingController();
  var chckme;
  var verifiedx;
  var onlinex;
  var seenx;
  var leo;
  List inverse2 = [];
  var bluex;
  var jayz;
  var net;
  var newlist;
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    print(barcodeScanRes);

    //here's  functs
    //final _controller = ScrollController();

    void senE(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Invalid "),
          content: Text("Didn't get the qrcode"),
        ),
      );
    }

    //add the http request here

    setState(() {
      _scanBarcode = barcodeScanRes;
      print(_scanBarcode.toString());
      final id = _scanBarcode.length;
      print(barcodeScanRes.substring(2, id));
      //this.getScan(_scanBarcode.toString());
    });
    //if (barcodeScanRes != true) return _launchURL(_scanBarcode.toString());

    if (barcodeScanRes.toString() != '-1' &&
        barcodeScanRes.toString().split('|')[0] == "AfleetUser") {
      print(barcodeScanRes.length);
      FlutterBeep.beep();
      Navigator.pop(
        context,
      );
      getScan(barcodeScanRes.toString());
      getScan2(barcodeScanRes.toString());
    } else {
      senE(context);
    }
  }

  String _scanBarcode = 'Unknown';
  Future getScan(String k) async {
    var k1 = k.split("|")[1].toString();
    //print(titleController.text);
    //pinned
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/information/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'title': 'message', //an actual title
        'whoiswho': widget.username.toString(),
        'writer': widget.username.toString(), //class teacher
        'mation': "${widget.username} connected with you",
        'to': k1.toString(), //class
        'date': now.toString() + '|' + leo.toString(),
      }),
    );
    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);
    print(jsonDecode(response1.body.toString()));
    //talos7.add(response1.body.toString());
    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }
    ;
    List<String> merge(List a, List b) {
      List<String> output = [];

      var min_length = min(a.length, b.length);
      var max_length = max(a.length, b.length);

      for (var i = 0; i < min_length; i++) {
        output.add(a[i]);
        output.add(b[i]);
      }

      List longer = a.length > b.length ? a : b;

      for (var i = min_length; i < max_length; i++) {
        output.add(longer[i]);
      }

      return output.toList();
    }
  }

  Future createAlbum() async {
    print(utf8.encode(titleController.text));
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/information/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'whoiswho': 'notification',
        'title': "mop", //an actual title
        'writer': widget.username, //class teacher
        'mation': titleController.text,
        'to':
            "[${widget.klass},${widget.school}]", //[${er['name']},${er['school']}]
        'date': now.toString() + '|' + leo.toString(),
      }),
    );
    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);

    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }
    ;

    //});
//save the token for next time
  }

  Future getScan2(String k) async {
    var k1 = k.split("|")[1].toString();
    //print(titleController.text);
    //pinned
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/information/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'title': 'message', //an actual title
        'whoiswho': k1.toString(),
        'writer': k1.toString(), //class teacher
        'mation': "You connected with ${k1}",
        'to': widget.username.toString(),
        'date': now.toString() + '|' + leo.toString(),
      }),
    );
    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);
    print(jsonDecode(response1.body.toString()));
    //talos7.add(response1.body.toString());
    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }
    ;
    List<String> merge(List a, List b) {
      List<String> output = [];

      var min_length = min(a.length, b.length);
      var max_length = max(a.length, b.length);

      for (var i = 0; i < min_length; i++) {
        output.add(a[i]);
        output.add(b[i]);
      }

      List longer = a.length > b.length ? a : b;

      for (var i = min_length; i < max_length; i++) {
        output.add(longer[i]);
      }

      return output.toList();
    }
  }

  Future getstatus2() async {
    http.Response responsev =
        await http.get(Uri.parse('https://afleet.co.ke/online/'));
    var xcv = jsonDecode(responsev.body);
    setState(() {
      net = xcv;
      //here you'll get the value of the username
      //the usernbame is unique thus you can use it as nany user driver// teacher // student
      // value = sky2;
    });
    print(net);
  }

  Future getstatus3() async {
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/online/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'username1': widget.username,
        'image': 'offline',
      }),
    );

    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);
    //print(jsonDecode(response2.body.toString()));

    print(jsonDecode(response1.body.toString()));
    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }
    ;

    //});
//save the token for next time
  }

  Future getstatus1() async {
    http.Response response1 = await http.post(
      Uri.parse('https://afleet.co.ke/online/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'username1': widget.username,
        'image': 'online',
      }),
    );

    //print(jsonDecode(response1.data.toString()) );
    //works => print(token['token']);
    //print(jsonDecode(response2.body.toString()));

    print(jsonDecode(response1.body.toString()));
    if (response1.statusCode == 201) {
      print("yea it happened");
      print(jsonDecode(response1.body.toString()));
    }
    ;

    //});
//save the token for next time
  }

  inmat() async {
    var headers = {
      'Authorization': 'Token ${widget.tr}',
    };
    final info2 = await http.get(Uri.parse('https://afleet.co.ke/information/'),
        headers:
            headers); //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('https://afleet.co.ke/verified/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final online = await http.get(
      Uri.parse('https://afleet.co.ke/online/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final seen = await http.get(
      Uri.parse('https://afleet.co.ke/seenx/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var info = jsonDecode(utf8.decode(info2.bodyBytes)); //returns info
    //info3
    var online1 = jsonDecode(utf8.decode(online.bodyBytes));
    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('verified', json.encode(verified1));
    sharedPreferences.setString('online', json.encode(online1));
    //sharedPreferences.setString('seen', json.encode(seen1));

    //sharedPreferences.setString('bluex', json.encode(bluex));
    /*setState(() {
      info3 = info;
      onlinex = online1;
      verifiedx = verified1;
      //seenx = seen1;
    });*/
    this.info3 = info;
    this.onlinex = online1;
    //seenx = seen1;
    this.verifiedx = verified1;
    print(info);
    print(onlinex);
    print(verifiedx);
    print(seenx);
    //}

    ;
  }
  var counter = 90;
  String xnm = '';
  offnd(int ll) {
    
    Timer.periodic(Duration(seconds: 1), (timer) {
      //http req to  and from server
      ll++;

      if (ll == 0) {
        //counter = 15;
        print('Cancel timer');
        timer.cancel();
      } else {
       ll == 0? inmat():"";//this right here is what
        //this.getMe();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fgr() async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var mode = sharedPreferences.getString('comnav2');
      var mode1 = sharedPreferences.getString('verified');
      var mode2 = sharedPreferences.getString('online');

      setState(() {
        info3 = jsonDecode(mode);
        verifiedx = jsonDecode(mode1);
        onlinex = jsonDecode(mode2);
      });
    }

    getstatus2();

    getstatus1();
    fgr();
    offnd(90);
    inmat();
    xnm = widget.klass.toString().replaceAll(' ', '');
    getstatus2();
    setState(() {
      //DateFormat('EEEE').format(date);
      now = DateFormat('EEEE d MMM').format(DateTime.now());
      //returns json body from api
      //this.courseblock = result1;
      leo = DateFormat.jm().format(DateTime.now());
    });
  }

  @override
  void dispose() {
    //_tabController.dispose();
   // this.counter = 0;
    offnd(0);
    print("====================================disposed");
    getstatus3();
    super.dispose();
   
  }

  @override
  Widget build(BuildContext context) {
   /* nbv(String sub) {
      print(widget.subs);
      //if(){}
      String x = '';
      var exx = widget.subs
          .toList()
          .map((g) => g['headline'] == sub.toString() ? x = g['code'] : '');
      print("eexxxx" + exx.toString());
      print("CODE" + x.toString());
      return x.toString();
    }*/

    

    List xmn = [];
    List bn = [];
    List mn = [];
    List mn2 = [];

    var mP2 = info3 == null
        ? {"to": "rono", "from": "yourgf"}
        : info3
            .where((vo) => vo['to'] == widget.username)
            .toList()
            .map((u) => u['writer'].toString())
            .toSet()
            .toList()
            .reversed
            .map((ry) =>
                ry.toString() != widget.username.toString() ? mn2.add(ry) : "");
    var mP = info3 == null
        ? {"to": "rono", "from": "yourgf"}
        : info3
            .where((vo) => vo['date'].split('|').length == 3
                ? vo['date'].split('|')[2].toString() ==
                    widget.username.toString()
                : vo['date'].split('|')[1].toString() ==
                    widget.username.toString())
            .toList()
            .map((u) => u['whoiswho'].toString())
            .toSet()
            .toList()
            .reversed
            .map((ry) => ry.toString() != widget.username.toString() &&
                    !["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                        .contains(ry.toString().substring(0, 1))
                ? mn.add(ry)
                : '');
    var scarter = [...mn2, ...mn];
    //merge(mn, mn2).map((e) => bluex.add(e));

    print(mP);
    print(mn);
    print(mP2);
    print(mn2);
    bluex = mn + mn2;
    vontime(String ry) {
      var c = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username && u['writer'] == ry.toString()
                  : u['to'] == ry.toString() &&
                      u['writer'] == widget.username // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['id']
          .toString()
          .substring(0);
      var b = info3
          .where((u) => u['whoiswho'] == widget.username
              ? u['to'] == ry.toString() && u['writer'] == widget.username
              : u['to'] == widget.username && u['writer'] == ry.toString())
          .last['id']
          .toString()
          .substring(0);
      print(c);
      print(b);
      var a = int.parse(c) < int.parse(b)
          ? info3
              .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username && u['writer'] == ry.toString()
                  : u['to'] == ry.toString() && u['writer'] == widget.username)
              .last['date']
              .toString()
          : info3
              .where((u) => u['whoiswho'] == widget.username
                      ? u['writer'] == widget.username &&
                          u['to'] == ry.toString()
                      : u['writer'] == ry.toString() &&
                          u['to'] == widget.username // &&
                  //  u['to'] ==
                  //    widget.username
                  )
              .last['date']
              .toString();
      /*var a = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username
                  : u['to'] == ry.toString() // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['mation']
          .toString()
          .substring(0);*/
      return a;
    }

    vonface(String ry) {
      var c = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['writer'] == widget.username
                  : u['to'] == ry.toString() // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['id']
          .toString()
          .substring(0);
      var b = info3
          .where((u) => u['whoiswho'] == ry.toString()
              ? u['to'] == widget.username
              : u['writer'] == ry.toString())
          .last['id']
          .toString()
          .substring(0);
      print(c);
      print(b);
      var a = int.parse(c) < int.parse(b)
          ? info3
              .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username && u['writer'] == ry.toString()
                  : u['writer'] == ry.toString() && u['to'] == widget.username)
              .last['']
              .toString()
          : info3
              .where((u) => u['whoiswho'] == ry.toString()
                      ? u['writer'] == widget.username &&
                          u['to'] == ry.toString()
                      : u['writer'] == ry.toString() &&
                          u['to'] == widget.username // &&
                  //  u['to'] ==
                  //    widget.username
                  )
              .last['date']
              .toString();
      /*var a = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username
                  : u['to'] == ry.toString() // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['mation']
          .toString()
          .substring(0);*/
      return a;
    }

    vontimex(String ry) {
      var c = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['writer'] == widget.username
                  : u['to'] == ry.toString() // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['id']
          .toString()
          .substring(0);
      var b = info3
          .where((u) => u['whoiswho'] == ry.toString()
              ? u['to'] == widget.username
              : u['writer'] == ry.toString())
          .last['id']
          .toString()
          .substring(0);
      print(c);
      print(b);
      var a = int.parse(c) < int.parse(b)
          ? info3
              .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username
                  : u['writer'] == ry.toString())
              .last['mation']
              .toString()
          : info3
              .where((u) => u['whoiswho'] == ry.toString()
                      ? u['writer'] == widget.username
                      : u['to'] == ry.toString() // &&
                  //  u['to'] ==
                  //    widget.username
                  )
              .last['']
              .toString();
      /*var a = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username
                  : u['to'] == ry.toString() // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['mation']
          .toString()
          .substring(0);*/
      return a;
    }

    von(String ry) {
      var ft = mn2.contains(ry)
          ? vontime(ry).substring(0)
          : info3
                      .where((u) =>
                          u['title'].contains('message') &&
                          u['whoiswho'] == ry.toString())
                      .last['date']
                      .split('|')
                      .last
                      .toString() ==
                  widget.username
              ? info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['date']
                  .toString()
              : info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['date']
                  .toString();
      print(ft);
      return ft;
    }

    vonx(String ry) {
      var ft = mn2.contains(ry)
          ? vontime(ry).substring(0)
          : info3
                      .where((u) =>
                          u['title'].contains('message') &&
                          u['whoiswho'] == ry.toString())
                      .last['date']
                      .split('|')
                      .last
                      .toString() ==
                  widget.username
              ? info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['mation']
                  .toString()
              : info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['mation']
                  .toString();
      print(ft);
      return ft;
    }

    vfx(String ty) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var nefw = sharedPreferences.getString(ty);
      print(nefw);

      return nefw;
    }

    ;
    calllist(List x) async {
      List mn = [];
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      for (var r in x) {
        mn.add(r);
        var demo = von(r);
        var mode = sharedPreferences.getString(r.tostring());
        print(mode);
        print(demo);
      }
      return mn;
    }

    von8time(String ry) {
      var c = info3
          .where((u) => u['whoiswho'] == widget.username
                  ? u['writer'] == widget.username && u['to'] == ry.toString()
                  : u['writer'] == ry.toString() &&
                      u['to'] == widget.username // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['id']
          .toString()
          .substring(0);
      var b = info3
          .where((u) => u['whoiswho'] == ry.toString()
              ? u['to'] == widget.username && u['writer'] == ry.toString()
              : u['to'] == ry.toString() && u['writer'] == widget.username)
          .last['id']
          .toString()
          .substring(0);
      print(c);
      print(b);
      var a = int.parse(c) < int.parse(b)
          ? info3
              .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username && u['writer'] == ry.toString()
                  : u['writer'] == ry.toString() && u['to'] == widget.username)
              .last['date']
              .toString()
              .substring(0)
          : info3
              .where((u) => u['whoiswho'] == widget.username
                      ? u['writer'] == widget.username &&
                          u['to'] == ry.toString()
                      : u['writer'] == ry.toString() &&
                          u['to'] == widget.username // &&
                  //  u['to'] ==
                  //    widget.username
                  )
              .last['date']
              .toString()
              .substring(0);
      /*var a = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username
                  : u['to'] == ry.toString() // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['mation']
          .toString()
          .substring(0);*/
      return a;
    }

    von8(String ry) {
      var c = info3
          .where((u) => u['whoiswho'] == widget.username
                  ? u['writer'] == widget.username && u['to'] == ry.toString()
                  : u['writer'] == ry.toString() &&
                      u['to'] == widget.username // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['id']
          .toString()
          .substring(0);
      var b = info3
          .where((u) => u['whoiswho'] == ry.toString()
              ? u['to'] == widget.username && u['writer'] == ry.toString()
              : u['to'] == ry.toString() && u['writer'] == widget.username)
          .last['id']
          .toString()
          .substring(0);
      print(c);
      print(b);
      var a = int.parse(c) < int.parse(b)
          ? info3
              .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username && u['writer'] == ry.toString()
                  : u['to'] == ry.toString() && u['writer'] == widget.username)
              .last['id']
              .toString()
              .substring(0)
          : info3
              .where((u) => u['whoiswho'] == widget.username
                      ? u['writer'] == widget.username &&
                          u['to'] == ry.toString()
                      : u['writer'] == ry.toString() &&
                          u['to'] == widget.username // &&
                  //  u['to'] ==
                  //    widget.username
                  )
              .last['id']
              .toString()
              .substring(0);
      /*var a = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username
                  : u['to'] == ry.toString() // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['mation']
          .toString()
          .substring(0);*/
      return a;
    }

    von8Inverse(String ry) {
      var c = info3
          .where((u) => u['whoiswho'] == widget.username
                  ? u['writer'] == widget.username && u['to'] == ry.toString()
                  : u['writer'] == ry.toString() &&
                      u['to'] == widget.username // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['id']
          .toString()
          .substring(0);
      var b = info3
          .where((u) => u['whoiswho'] == ry.toString()
              ? u['to'] == widget.username && u['writer'] == ry.toString()
              : u['to'] == ry.toString() && u['writer'] == widget.username)
          .last['id']
          .toString()
          .substring(0);
      print(c);
      print(b);
      var a = int.parse(c) > int.parse(b)
          ? info3
              .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username && u['writer'] == ry.toString()
                  : u['to'] == ry.toString() && u['writer'] == widget.username)
              .last['id']
              .toString()
              .substring(0)
          : info3
              .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username && u['writer'] == ry.toString()
                  : u['to'] == ry.toString() && u['writer'] == widget.username)
              .last['id']
              .toString()
              .substring(0);
      /*var a = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username
                  : u['to'] == ry.toString() // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['mation']
          .toString()
          .substring(0);*/
      return a;
    }

    von7(String ry) {
      var c = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['writer'] == ry.toString() && u['to'] == widget.username
                  : u['to'] == ry.toString() &&
                      u['writer'] == widget.username // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['id']
          .toString()
          .substring(0);
      var b = info3
          .where((u) => u['whoiswho'] == ry.toString()
              ? u['to'] == widget.username && u['writer'] == ry.toString()
              : u['writer'] == widget.username && u['to'] == ry.toString())
          .last['id']
          .toString()
          .substring(0);
      print(c);
      print(b);
      var a = int.parse(c) < int.parse(b)
          ? info3
              .where((u) => u['whoiswho'] == widget.username &&
                          u['writer'] == widget.username &&
                          u['to'] == ry.toString()
                      ? u['writer'] == widget.username &&
                          u['to'] == ry.toString()
                      : u['writer'] == ry.toString() &&
                          u['to'] == widget.username
                  //  u['to'] ==
                  //    widget.username
                  )
              .last['mation']
              .toString()
              .substring(0)
          : info3
              .where((u) => u['whoiswho'] == ry.toString() &&
                      u['writer'] == ry.toString() &&
                      u['to'] == widget.username
                  ? u['to'] == widget.username && u['writer'] == ry.toString()
                  : u['writer'] == widget.username && u['to'] == ry.toString())
              .last['mation']
              .toString()
              .substring(0);
      /*var a = info3
          .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username
                  : u['to'] == ry.toString() // &&
              //  u['to'] ==
              //    widget.username
              )
          .last['mation']
          .toString()
          .substring(0);*/
      return a;
    }

    von3(String ry) {
      var ft = mn2.contains(ry)
          ? info3
              .where((u) => u['whoiswho'] == ry.toString()
                  ? u['to'] == widget.username
                  : u['writer'] == ry.toString() && u['to'] == widget.username)
              .last['id']
              .toString()
              .substring(0)
          : info3
                      .where((u) =>
                          u['title'].contains('message') &&
                          u['whoiswho'] == ry.toString())
                      .last['id']
                      .toString() ==
                  widget.username
              ? info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['id']
                  .toString()
              : info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['id']
                  .toString();
      print(ft);
      xmn.add(int.parse(ft));
      xmn.sort();
      print(xmn);
      return xmn.reversed;
    }

    von2time(String ry) {
      var ft = mn2.contains(ry)
          ? von8time(ry)
          : info3
                      .where((u) =>
                          u['title'].contains('message') &&
                          u['whoiswho'] == ry.toString())
                      .last['id']
                      .toString() ==
                  widget.username
              ? info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['date']
                  .toString()
              : info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['date']
                  .toString();
      print(ft);
      //printvon7(ry.toString());
      //print(xmn.reversed);
      return ft;
    }

    von2Inverse(String ry) {
      var ft = mn2.contains(ry)
          ? von8Inverse(ry)
          : info3
                      .where((u) =>
                          u['title'].contains('message') &&
                          u['whoiswho'] == ry.toString())
                      .last['id']
                      .toString() ==
                  widget.username
              ? info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['id']
                  .toString()
              : info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['id']
                  .toString();
      print(ft);
      //printvon7(ry.toString());
      //print(xmn.reversed);
      return int.parse(ft);
    }

    von2(String ry) {
      var ft = mn2.contains(ry)
          ? von8(ry)
          : info3
                      .where((u) =>
                          u['title'].contains('message') &&
                          u['whoiswho'] == ry.toString())
                      .last['id']
                      .toString() ==
                  widget.username
              ? info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['id']
                  .toString()
              : info3
                  .where((u) =>
                      u['title'].contains('message') &&
                      u['whoiswho'] == ry.toString())
                  .last['id']
                  .toString();
      print(ft);
      //printvon7(ry.toString());
      //print(xmn.reversed);
      return int.parse(ft);
    }

    bluex.sort((a, b) => von2(a).compareTo(von2(b)));
    print(scarter);
    print(bluex);
    Future tatuseen(String ry) async {
      http.Response response1 = await http.post(
        Uri.parse('https://afleet.co.ke/seen/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        }, //'id','sender','message_me','receiver','time'
        body: jsonEncode(<String, String>{
          //'id': titleController.text,this is an autofield
          'username1': widget.username,
          'image': "${ry}" + "|" + "${von2(ry.toString())}",
        }),
      );

      //print(jsonDecode(response1.data.toString()) );
      //works => print(token['token']);
      //print(jsonDecode(response2.body.toString()));

      print(jsonDecode(response1.body.toString()));
      if (response1.statusCode == 201) {
        print("yea it happened");
        print(jsonDecode(response1.body.toString()));
      }
      ;

      //});
//save the token for next time
    }

    nbh() async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var bluex = sharedPreferences.getString('bluex');
      var seen = sharedPreferences.getString('seen');
    }
    //sha

    fgr() async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var mode = sharedPreferences.getString('comnav2');

      info3 = jsonDecode(mode);
    }

    //inmat();
    //rint(title1);
    return info3 == null && bluex == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : DefaultTabController(
            length: 1,
            child:  Scaffold(
                backgroundColor:
                    widget.kala1 ? Colors.black : Colors.grey.shade50,
                appBar: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          //height:1.0,
                          //width: 1.0,
                          color: Colors.transparent//deepPurple,
                        ),
                        ),
                    tabs: [
                      Text(''),
                      
                    ]),
                body: TabBarView(children: [
                  // ignore: unnecessary_null_comparison
                  bluex == null && info3 == null
                      ? Scaffold(
                          backgroundColor:
                              widget.kala1 ? Colors.black : Colors.white,
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Scaffold(
                        extendBody: true,
                        bottomNavigationBar: Container(color: Colors.transparent,
                        height:50
                        ),
                          floatingActionButtonLocation:
                              FloatingActionButtonLocation.endFloat,
                          floatingActionButton: FloatingActionButton(
                            backgroundColor: Colors.cyan.shade600,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => searchQ(
                                        misearch: widget.students,//
                                        profpic: widget.profpic,
                                        kala1: widget.kala1,
                                        username: widget.username,
                                        token: widget.tr)), // sky2['username']
                              );
                            },
                            child: Icon(Icons.chat_outlined),
                          ),
                          backgroundColor:
                              widget.kala1 ? Colors.black : Colors.white,
                          //width: MediaQuery.of(context).size.width,
            
                          
                          body: SingleChildScrollView(
                              child: Column(children: [
                              //  SizedBox(height:20),
                            //here are your groups
                            //Text(xmn.toString()),
                            //Text(
                            //"${bluex.sort(von2(z.toString()))}"), //.map((e) => Text(e.toString())),
                            ...bluex.reversed
                                .where((z) => von2(z.toString()) != 0)
                                .map((ry) => Card(
                                    elevation: 0.0,
                                    color: Colors.transparent,
                                    child: Column(children: [
                                      // Text("${xmn.sort()}+${von2(ry)}"),
                                      ListTile(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10))),
                                        tileColor: widget.kala1
                                            ? Colors.black
                                            : Colors.white,
                                        onTap: () {
                                          //von(ry);
                                          inverse2.add(von2Inverse(ry));
                                          void rx() {
                                            bn.add(von2(ry.toString()));
            
                                            print(bn);
                                          }
            
                                          rx();
            
                                          /*sharedPreferences.setString(
                                      'comnav2', json.encode(info));*/
            
                                          //storeshared
                                          //print(">>>>>>>>>>>>>>>>>"+ft.toString());
                                          setState(() {
                                            bn.add(von2(ry.toString()));
                                            print(bn);
                                          });
                                          tatuseen(ry);
                                          !mn2.contains(ry)
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        FriendMess2(
                                                      title: ry.toString(),
                                                      token: widget.tr.toString(),
                                                      myname: '',
                                                      user: widget.username
                                                          .toString(),
                                                      code: ry.toString(),
                                                    ),
                                                  ), //MaterialPageRoute
                                                )
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        FriendMess(
                                                      title: ry.toString(),
                                                      // repl: "0",
                                                      //profpic: widget.profpic,
                                                      newc: info3.toList(),
                                                      token: widget.tr,
                                                      myname: '',
                                                      user: widget.username, repl: '',
                                                    ),
                                                  ), //MaterialPageRoute
                                                );
                                          /*Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => FriendMess(
                                                repl: '',
                                                newc: [],
                                                title: ry.toString(),
                                                token: widget.tr,
                                                myname: '',
                                                user: widget.username.toString(),
                                              ),
                                            ), //MaterialPageRoute
                                          );*/
                                          /*Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => FriendMess(
                                                title: xnm.toString(),
                                                repl: chckme.toString(),
                                                newc: info3.toList(),
                                                token: widget.tr,
                                                myname: '',
                                                user: widget.username.toString(),
                                              ),
                                            ), //MaterialPageRoute
                                          );*/
                                        },
                                        leading: mn2.contains(ry)
                                            ? Container(
                                                child: Stack(children: [
                                                CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Text(ry
                                                      .toString()
                                                      .substring(0, 1)),
                                                ),
                                                ...widget.profpic.map(
                                                  (ui) => ui['username1'] ==
                                                          ry.toString()
                                                      ? CircleAvatar(
                                                          radius: 25,
                                                          backgroundColor:
                                                              Colors.transparent,
            
                                                          backgroundImage:
                                                              NetworkImage(
                                                            ui['image'],
                                                          ), //ui['image'],
                                                        )
                                                      : SizedBox(
                                                          //ui['image'],
                                                          ),
                                                ),
                                                Positioned(
                                                  right: -2,
                                                  bottom: 0,
                                                  child: Container(
                                                      child: Stack(children: [
                                                    ...onlinex.map((ui) => ui[
                                                                'username1'] ==
                                                            ry.toString()
                                                        ? ui["image"].contains(
                                                                "online")
                                                            ? CircleAvatar(
                                                                radius: 7,
                                                                backgroundColor: widget
                                                                        .kala1
                                                                    ? Colors
                                                                        .black12
                                                                    : Colors
                                                                        .white, //white,
                                                                child: CircleAvatar(
                                                                    radius: 5,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    child: null))
                                                            : CircleAvatar(
                                                                radius: 7,
                                                                backgroundColor:
                                                                    widget.kala1
                                                                        ? Colors
                                                                            .black12
                                                                        : Colors
                                                                            .white,
                                                                child: CircleAvatar(
                                                                    radius: 5,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    child: null))
                                                        : Container()),
                                                  ])),
                                                ),
                                              ]))
                                            : Stack(children: [
                                                CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Text(
                                                    ry.toString().substring(0, 1),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: CircleAvatar(
                                                      radius: 7,
                                                      child: Icon(Icons.group,
                                                          size: 10)),
                                                )
                                              ]), //ui['image'],
            
                                        title: Row(children: [
                                          Text(ry.toString(),
                                              style: GoogleFonts.lato(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: !widget.kala1
                                                      ? Colors.black
                                                      : Colors.white)),
                                          SizedBox(
                                            
                                              child: Stack(children: [
                                            ...verifiedx.map(
                                              (ui) => ui['username1'] ==
                                                          ry.toString() &&
                                                      ui["image"] == "Zeus"
                                                  ? Icon(Icons.verified,
                                                      size: 13,
                                                      color: Colors.blue)
                                                  : SizedBox(
                                                      //ui['image'],
                                                      ),
                                            ),
                                            ...verifiedx.map(
                                              (ui) => ui['username1'] ==
                                                          ry.toString() &&
                                                      ui["image"] == "realZeus"
                                                  ? Row(children: [
                                                      Icon(Icons.verified,
                                                          size: 13,
                                                          color:
                                                              Colors.cyan.shade600),
                                                      Icon(Icons.bolt,
                                                          size: 18,
                                                          color: Colors.amber)
                                                    ])
                                                  : SizedBox(
                                                      //ui['image'],
                                                      ),
                                            ),
                                          ]))
                                        ]),
                                        subtitle: Row(children: [
                                          inverse2 != null
                                              ? !inverse2
                                                      .contains(von2Inverse(ry))
                                                  ? CircleAvatar(
                                                      radius: 2,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                    )
                                                  : SizedBox()
                                              : SizedBox(),
                                          /*Stack(children: [
                                            ...widget.profpic.map(
                                              (ui) =>
                                                  ui['username1'] == ry.toString()
                                                      ? CircleAvatar(
                                                          radius: 8,
                                                          backgroundColor:
                                                              Colors.transparent,
            
                                                          backgroundImage:
                                                              NetworkImage(
                                                            ui['image'],
                                                          ), //ui['image'],
                                                        )
                                                      : SizedBox(
                                                          //ui['image'],
                                                          ),
                                            )
                                          ]),*/
                                          mn2.contains(ry)
                                              ? Text(
                                                  "",
                                                  style: TextStyle(
                                                    color: !widget.kala1
                                                        ? Colors.blueGrey.shade900
                                                        : Colors.white,
                                                  ),
                                                )
                                              : SizedBox(),
                                          mn2.contains(ry)
                                              ? von7(ry)
                                                      .toString()
                                                      .substring(0, 1)
                                                      .contains("[")
                                                  ? Icon(
                                                      Icons.question_answer,
                                                      size: 15,
                                                      color: !widget.kala1
                                                          ? Colors
                                                              .blueGrey.shade900
                                                          : Colors.white,
                                                    )
                                                  : SizedBox()
                                              : SizedBox(),
                                          SizedBox(width: 2),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .45,
                                            child: Text(
                                              mn2.contains(ry)
                                                  ? von7(ry)
                                                          .toString()
                                                          .substring(0, 1)
                                                          .contains("[")
                                                      ? von7(ry)
                                                          .split(",")[1]
                                                          .replaceAll("]", "")
                                                          .toString()
                                                      : von7(ry).toString()
                                                  : info3.where((u) => u['title'].contains('message') && u['whoiswho'] == ry.toString()).last['date'].split('|').last.toString() ==
                                                          widget.username
                                                      ? "You" +
                                                          ": " +
                                                          (info3.where((u) => u['title'].contains('message') && u['whoiswho'] == ry.toString()).last['mation'].toString().substring(0, 1).contains("[")
                                                              ? info3.where((u) => u['title'].contains('message') && u['whoiswho'] == ry.toString()).last['mation'].toString().split(",")[1].replaceAll(
                                                                  "]", "")
                                                              : info3
                                                                  .where((u) =>
                                                                      u['title'].contains('message') &&
                                                                      u['whoiswho'] ==
                                                                          ry
                                                                              .toString())
                                                                  .last['mation']
                                                                  .toString())
                                                      : info3.where((u) => u['title'].contains('message') && u['whoiswho'] == ry.toString()).last['date'].split('|').last.toString() +
                                                          ": " +
                                                          (info3.where((u) => u['title'].contains('message') && u['whoiswho'] == ry.toString()).last['mation'].toString().substring(0, 1).contains("[")
                                                              ? info3
                                                                  .where((u) =>
                                                                      u['title'].contains('message') &&
                                                                      u['whoiswho'] ==
                                                                          ry.toString())
                                                                  .last['mation']
                                                                  .toString()
                                                                  .split(",")[1]
                                                                  .replaceAll("]", "")
                                                              : info3.where((u) => u['title'].contains('message') && u['whoiswho'] == ry.toString()).last['mation'].toString()),
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: !widget.kala1
                                                    ? Colors.blueGrey.shade900
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ]),
                                        trailing: InkWell(
                                          child: Column(children: [
                                            //(von(ry)),
                                            //Text(bn.toString()),
                                            Text(
                                              von2time(ry)
                                                          .toString()
                                                          .split('|')[0]
                                                          .toString() ==
                                                      now
                                                  ? von2time(ry).split("|")[1]
                                                  : von2time(ry).split("|")[0],
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: bn.indexOf(
                                                            "${von2(ry.toString())}") !=
                                                        -1
                                                    ? Colors.red
                                                    : !widget.kala1
                                                        ? Colors.blueGrey.shade900
                                                        : Colors.white,
                                              ),
                                            ),
            
                                            /*RotatedBox(
                                              quarterTurns: 90,
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor:
                                                      Colors.deepPurple,
                                                  child: Icon(
                                                    Icons.arrow_back_ios_new,
                                                    color: Colors.white,
                                                    size: 12,
                                                  ),
                                                ),
                                              ),
                                            ),*/
                                            /*Positioned(
                                                top: -2,
                                                right: -1,
                                                child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor: Colors
                                                        .transparent, //white,
                                                    child: CircleAvatar(
                                                      radius: 5,
                                                      backgroundColor: Colors
                                                          .transparent, //red,
                                                      child:
                                                          null /*Center(
                                                      child: Text(
                                                          int.parse(crpt
                                                                      .toString()) >
                                                                  5
                                                              ? ''
                                                              : crpt,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color:
                                                                  Colors.white)))*/
                                                      ,
                                                    )))*/
                                          ]),
                                          onTap: () {},
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(),
                                            Container(
                                              height: 0.07,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .80,
                                              color: widget.kala1
                                                  ? Colors.grey[300]
                                                  : Colors.grey[500],
                                            )
                                          ]),
                                    ])))
                          ]))),
                  /*Scaffold(
                    backgroundColor:
                        widget.kala1 ? Colors.black : Colors.grey.shade50,
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              //  sum = 0;
                              //var given_list = [1, 2, 3, 4, 5];
            
                              return Scaffold(
                                backgroundColor: !widget.kala1
                                    ? Colors.white
                                    : Colors.grey.shade900,
                                body: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    Container(
                                      height: 10,
                                    ),
                                    // ListTile(),
                                    /*
                                                        "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
                                                        */
                                    ListTile(
                                      onTap: () {},
                                      title: Row(children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(7),
                                          //height: 50,
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.80,
                                          child: Container(
                                            //color: Colors.blueGrey[900],
                                            child: TextField(
                                              keyboardType: TextInputType.text,
                                              autofocus: true,
                                              maxLines: null,
                                              onChanged: (value) {
                                                setState(() {
                                                  //DateFormat('EEEE').format(date);
                                                  this.now =
                                                      DateFormat('EEEE d MMM')
                                                          .format(DateTime.now());
                                                  //returns json body from api
                                                  //this.courseblock = result1;
                                                  this.leo = DateFormat.jm()
                                                      .format(DateTime.now());
                                                });
                                                enabled:
                                                false;
                                              },
                                              style: TextStyle(
                                                  color: Colors.grey[100]),
                                              //void man => value.toString();
            
                                              decoration: InputDecoration(
                                                  // prefixIcon: Icon(Icons.storefront),
                                                  filled: true,
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey[50]),
                                                  fillColor: Colors.grey[900],
                                                  hintText: 'Share your Idea',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[50]),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0))),
                                              controller: titleController,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                       widget.username == "exampleuser"?  InkWell(
                onTap:(){
                   const snackBar = SnackBar(
                                            content: Text(
                                                "this is a demo account ,you can' send messages"),
                                          );
            
                                          // Find the ScaffoldMessenger in the widget tree
                                          // and use it to show a SnackBar.
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                },
                child: CircleAvatar(
                  backgroundColor:Colors.deepPurple.withOpacity(0.2),
                    child: Icon(Icons.send_outlined),
                  ),
              ): GestureDetector(
                                          // Redraw the Stateful Widget
            
                                          onTap: () async {
                                            //talos7.add(titleController.text.toString());
                                            //talos7.reversed.toList().removeLast();
                                            if (titleController.text.length > 0) {
                                              createAlbum();
                                              titleController.clear();
                                            } /*                litems.add(titleController.text.toString());
                                    _scrollController.animateTo(
                                        _scrollController.position.maxScrollExtent,
                                        duration: Duration(milliseconds: 60),
                                        curve: Curves.fastOutSlowIn);
                                    
                                    if (titleController.text.length > 0) {
                                      Data = await GetData(
                                          'http://192.168.100.20:5000/api?Query=' +
                                              titleController.text.toString());
                                      litems2.add(json.decode(Data));
                                      // Append Text to the list
                                      //ItemScrollController _scrollController = ItemScrollController();
                                      //       _scrollController.jumpTo(pos);
            
                                      titleController.clear();
                                      // Clear the Text area
                                      setState(() {});
                                      clearText();
            
                                      sleep(const Duration(milliseconds: 500));
            
                                      
                                      return litems2;
                                    } else {
                                      try {
                                        if (titleController.text.length > 0) {
                                          litems2.add("Am Offline for the moment");
                                        }
                                      } catch (e) {
                                        titleController.clear();
                                      }
            
                                      ;
                                    }
                                  }*/
                                          },
            
                                          child: CircleAvatar(
                                            child: Icon(Icons.send_outlined),
                                          ),
                                          onLongPress: () {},
                                        ),
                                        SizedBox(width: 5),
                                      ]),
                                    ),
                                    ListTile(), ListTile(), ListTile(),
                                    ListTile(
                                        onTap: () {},
                                        tileColor: Colors.black12,
                                        //leading: ,
                                        title: Text(
                                          "",
                                        ),
                                        subtitle: Text("",
                                            style: TextStyle(
                                              color: !widget.kala1
                                                  ? Colors.white
                                                  : Colors.black,
                                            ))),
                                  ],
                                )),
                                //bottoma navigation bar
                              );
                            });
                      },
                      child: Icon(Icons.create_outlined),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /*Container(
                          width: MediaQuery.of(context).size.width*.95,
                          child: TextField(
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                prefixIcon: Icon(Icons.search),
                                hintText: "search",
                                border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0)
                    ),
                                focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: !widget.kala1?Colors.grey.shade300:Colors.grey.shade800, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0)))),
                        ),SizedBox(height: 10,),*/
                          //Text(title1.toString()),
                          //,
            
                          /*
                            
                                              u['title'].contains('message') && 
                                                      u['whoiswho'] ==
                                                          widget.user.toString()
                                                  ? u['writer'] ==
                                                              widget.user
                                                                  .toString() &&
                                                          u['to'] ==
                                                              widget.title.toString() 
                                                      
                            */ /*&&ry['title']=='message' &&ry['to'].split(',')[0].toString() !=
                                        widget.klass.toString().replaceAll(',', '').replaceAll('(', '').replaceAll(')', '') &&
                               
                                ry['to'].split(',')[0].toString() != "all"&&
                                ry['title'].toString()=='Fees'
                                //////////////////////////
                                  ry['to']
                                    .split(',')[0]
                                    .toString()
                                    .replaceAll('[', '')
                                    .toString() == xnm.toString() 
                            &&
                                */
                          /*
                                info3
                                                                    .where((u) =>
                                                                        u['title']
                                                                            .contains(
                                                                                'message') &&
                                                                        u['whoiswho'] ==
                                                                            ry['id']
                                                                                .toString())
                                 */
            
                          ...info3 == null
                              ? ["1", "2"].map((i) => Text(""))
                              : info3
                                  .where((u) =>
                                      u['whoiswho'].toString() ==
                                          'notification' &&
                                      u['to']
                                              .split(',')[0]
                                              .toString()
                                              .replaceAll('[', '')
                                              .replaceAll(' ', '')
                                              .toString() ==
                                          xnm.toString())
                                  .toList()
                                  .reversed
                                  .map((ry) => ry['whoiswho'].toString() ==
                                              'notification' &&
                                          ry['to']
                                                  .split(',')[0]
                                                  .toString()
                                                  .replaceAll('[', '')
                                                  .replaceAll(' ', '')
                                                  .toString() ==
                                              xnm.toString()
                                      ? InkWell(
                                          onTap: () {
                                            /*showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              //  sum = 0;
                                              //var given_list = [1, 2, 3, 4, 5];
            
                                              return Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .2,
                                                color: !widget.kala1
                                                    ? Colors.white
                                                    : Colors.black,
                                                child: SingleChildScrollView(
                                                    child: Column(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                    ),
                                                    // ListTile(),
                                                    /*
                                                            "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
                                                            */
                                                    ListTile(
                                                        onTap: () {
                                                          var chckme =
                                                              info3.indexOf(ry);
                                                          print(">.>>>>>>>>" +
                                                              chckme.toString());
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      FriendMess3(
                                                                title: ry['id']
                                                                    .toString(),
                                                                //repl: chckme.toString(),
                                                                //newc: info3.toList(),
                                                                token: widget.tr,
                                                                myname: '',
                                                                user: widget
                                                                    .username,
                                                              ),
                                                            ), //MaterialPageRoute
                                                          );
                                                        },
                                                        tileColor: Colors.black12,
                                                        leading: Icon(Icons.reply,
                                                            color: Colors
                                                                .deepPurple),
                                                        title: Text(
                                                            "Reply to this post",
                                                            style: TextStyle(
                                                              color: widget.kala1
                                                                  ? Colors.white
                                                                  : Colors.black,
                                                            )),
                                                        subtitle: Text("",
                                                            style: TextStyle(
                                                              color: !widget.kala1
                                                                  ? Colors.white
                                                                  : Colors.black,
                                                            ))),
                                                    ListTile(
                                                        onTap: () {
                                                          inmat();
                                                          setState(() {
                                                            chckme =
                                                                info3.indexOf(ry);
                                                            print(">.>>>>>>>>" +
                                                                chckme
                                                                    .toString());
                                                          });
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FriendMessX1(
                                                                title: ry[
                                                                        'writer']
                                                                    .toString(),
                                                                repl: chckme
                                                                    .toString(),
                                                                newc: info3
                                                                    .toList(),
                                                                token: widget.tr,
                                                                myname: '',
                                                                user: widget
                                                                    .username,
                                                              ),
                                                            ), //MaterialPageRoute
                                                          );
                                                        },
                                                        tileColor: Colors.black12,
                                                        leading: Icon(
                                                            Icons
                                                                .chat_bubble_outline_outlined,
                                                            color: Colors
                                                                .deepPurple),
                                                        title: Text(
                                                            "Reply privately to ${ry['writer'].toString()}",
                                                            style: TextStyle(
                                                              color: widget.kala1
                                                                  ? Colors.white
                                                                  : Colors.black,
                                                            )),
                                                        subtitle: Text("",
                                                            style: TextStyle(
                                                              color: !widget.kala1
                                                                  ? Colors.white
                                                                  : Colors.black,
                                                            ))),
                                                    /*ListTile(
                                                      onTap: () {
                                                        inmat();
                                                        chckme = info3.indexOf(ry);
                                                        print(">.>>>>>>>>" +
                                                            chckme.toString());
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                FriendMessX1(
                                                              title: ry['writer']
                                                                  .toString(),
                                                              repl: chckme.toString(),
                                                              newc: info3.toList(),
                                                              token: widget.tr,
                                                              myname: '',
                                                              user: widget.username,
                                                            ),
                                                          ), //MaterialPageRoute
                                                        );
                                                      },
                                                      tileColor: Colors.black12,
                                                      leading: Icon(
                                                          Icons
                                                              .chat_bubble_outline_outlined,
                                                          color: Colors.deepPurple),
                                                      title: Text(
                                                          "Reply privately to ${ry['writer'].toString()}",
                                                          style: TextStyle(
                                                            color: widget.kala1
                                                                ? Colors.white
                                                                : Colors.black,
                                                          )),
                                                      subtitle: Text("",
                                                          style: TextStyle(
                                                            color: !widget.kala1
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ))),*/
                                                  ],
                                                )),
                                                //bottoma navigation bar
                                              );
                                            });*/
                                          },
                                          child: Card(
                                              color: widget.kala1
                                                  ? Colors.black
                                                  //.withOpacity(0.2)
                                                  : Colors.grey.shade50,
                                              elevation: 0,
                                              child: Column(children: [
                                                /*Container(
                                          height: MediaQuery.of(context).size.height*.3,
                                          width: MediaQuery.of(context).size.width*.9,
                                      
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(
                                              20.0) //                 <--- border radius here
                                          ),
                                      image: DecorationImage(
                                        image: NetworkImage('https://rs5.rcnoc.com:2083/cpsess2186087691/viewer/home%2fafleetco%2fafleet.co.ke%2fmedia%2fimages/20221001_211706.jpg'),
                                         //   ry['image'].toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                        ),*/
                                                //he im rn
                                                //Text( ry['whoiswho'].toString()),
            
                                                ListTile(
                                                    //tileColor: widget.kala1?Colors.blueGrey.shade900:Colors.white,
                                                    leading: Container(
                                                        child: Stack(children: [
                                                      CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            Colors.deepPurple,
                                                        child: Text(ry['writer']
                                                            .toString()
                                                            .substring(0, 1)),
                                                      ),
                                                      ...widget.profpic.map(
                                                        (ui) => ui['username1'] ==
                                                                ry['writer']
                                                                    .toString()
                                                            ? CircleAvatar(
                                                                radius: 20,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
            
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                  ui['image'],
                                                                ), //ui['image'],
                                                              )
                                                            : SizedBox(
                                                                //ui['image'],
                                                                ),
                                                      ),
                                                    ])),
                                                    title: Row(children: [
                                                      Text(
                                                          ry["writer"].toString(),
                                                          style: GoogleFonts.lato(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color: !widget.kala1
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .grey)),
                                                      Container(
                                                          child: Stack(children: [
                                                        ...verifiedx.map(
                                                          (ui) => ui['username1'] ==
                                                                      ry["writer"]
                                                                          .toString() &&
                                                                  ui["image"] ==
                                                                      "Zeus"
                                                              ? Icon(
                                                                  Icons.verified,
                                                                  size: 12,
                                                                  color:
                                                                      Colors.blue)
                                                              : SizedBox(
                                                                  //ui['image'],
                                                                  ),
                                                        ),
                                                        ...verifiedx.map(
                                                          (ui) => ui['username1'] ==
                                                                      ry["writer"]
                                                                          .toString() &&
                                                                  ui["image"] ==
                                                                      "realZeus"
                                                              ? Row(children: [
                                                                  Icon(
                                                                      Icons
                                                                          .verified,
                                                                      size: 14,
                                                                      color: Colors
                                                                          .deepPurple),
                                                                  Icon(Icons.bolt,
                                                                      size: 14,
                                                                      color: Colors
                                                                          .amber)
                                                                ])
                                                              : SizedBox(
                                                                  //ui['image'],
                                                                  ),
                                                        ),
                                                      ]))
                                                    ]),
                                                    subtitle:Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .8,
                                                  child: Text(
                                                    ry['mation'].toString(),
                                                    // textDirection:TextDirection.LTR,
                                                    style: GoogleFonts.lato(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: !widget.kala1
                                                          ? Colors
                                                              .blueGrey.shade900
                                                          : Colors.white,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                    /*subtitle: ry['title']
                                                                .toString() ==
                                                            "mop"
                                                        ? SizedBox()
                                                        : Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                                Row(children: [
                                                                  Text(
                                                                    ry['title'].toString() ==
                                                                            "mop"
                                                                        ? ""
                                                                        : ry['title']
                                                                            .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: widget
                                                                              .kala1
                                                                          ? Colors.grey[
                                                                              300]
                                                                          : Colors
                                                                              .grey[500],
                                                                    ),
                                                                  ),
                                                                ]),
                                                                Text(""),
                                                              ]),*/
                                                    trailing: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                              context: context,
                                                              builder: (context) {
                                                                //  sum = 0;
                                                                //var given_list = [1, 2, 3, 4, 5];
            
                                                                return Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      .2,
                                                                  color: !widget
                                                                          .kala1
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey
                                                                          .shade900,
                                                                  child:
                                                                      SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      // ListTile(),
                                                                      /*
                                                            "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
                                                            */
                                                                      ListTile(
                                                                          onTap:
                                                                              () {
                                                                            var chckme =
                                                                                info3.indexOf(ry);
                                                                            print(">.>>>>>>>>" +
                                                                                chckme.toString());
                                                                            Navigator
                                                                                .push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => FriendMess3(
                                                                                  title: ry['id'].toString(),
                                                                                  //repl: chckme.toString(),
                                                                                  //newc: info3.toList(),
                                                                                  token: widget.tr,
                                                                                  myname: '',
                                                                                  user: widget.username,
                                                                                ),
                                                                              ), //MaterialPageRoute
                                                                            );
                                                                          },
                                                                          tileColor:
                                                                              Colors
                                                                                  .black12,
                                                                          leading: Icon(
                                                                              Icons
                                                                                  .reply,
                                                                              color: Colors
                                                                                  .deepPurple),
                                                                          title: Text(
                                                                              "Reply to this post",
                                                                              style:
                                                                                  TextStyle(
                                                                                color: widget.kala1 ? Colors.white : Colors.black,
                                                                              )),
                                                                          subtitle: Text(
                                                                              "",
                                                                              style:
                                                                                  TextStyle(
                                                                                color: !widget.kala1 ? Colors.white : Colors.black,
                                                                              ))),
                                                                      ListTile(
                                                                          onTap:
                                                                              () {
                                                                            var chckme =
                                                                                info3.indexOf(ry);
                                                                            print(">.>>>>>>>>" +
                                                                                chckme.toString());
                                                                            Navigator
                                                                                .push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => FriendMessX1(
                                                                                  title: ry['writer'].toString(),
                                                                                  repl: chckme.toString(),
                                                                                  newc: info3.toList(),
                                                                                  token: widget.tr,
                                                                                  myname: '',
                                                                                  user: widget.username,
                                                                                ),
                                                                              ), //MaterialPageRoute
                                                                            );
                                                                          },
                                                                          tileColor:
                                                                              Colors
                                                                                  .black12,
                                                                          leading: Icon(
                                                                              Icons
                                                                                  .chat_bubble_outline_outlined,
                                                                              color: Colors
                                                                                  .deepPurple),
                                                                          title: Text(
                                                                              "Reply privately to ${ry['writer'].toString()}",
                                                                              style:
                                                                                  TextStyle(
                                                                                color: widget.kala1 ? Colors.white : Colors.black,
                                                                              )),
                                                                          subtitle: Text(
                                                                              "",
                                                                              style:
                                                                                  TextStyle(
                                                                                color: !widget.kala1 ? Colors.white : Colors.black,
                                                                              ))),
                                                                    ],
                                                                  )),
                                                                  //bottoma navigation bar
                                                                );
                                                              });
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .more_horiz_outlined,
                                                          color: widget.kala1
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ))),
                                                /*ListTile(
                                              //leading:Icon(Icons.person_outlined,color: Colors.deepPurple,),
            
                                              title: Text(
                                                ry['mation'].toString() + ".",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  color: !widget.kala1
                                                      ? Colors.blueGrey.shade900
                                                      : Colors.white,
                                                ),
                                              ),
                                              //trailing: Icon(Icons.notifications_outlined)
                                            ),*/
                                                
                                                ListTile(
                                                  title: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            var chckme =
                                                                info3.indexOf(ry);
                                                            print(">.>>>>>>>>" +
                                                                chckme
                                                                    .toString());
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        FriendMess3(
                                                                  title: ry['id']
                                                                      .toString(),
                                                                  //repl: chckme.toString(),
                                                                  //newc: info3.toList(),
                                                                  token:
                                                                      widget.tr,
                                                                  myname: '',
                                                                  user: widget
                                                                      .username,
                                                                ),
                                                              ), //MaterialPageRoute
                                                            );
                                                          },
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .25,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  child: Icon(
                                                                    Icons.comment,
                                                                    size: 20,
                                                                    color: !widget
                                                                            .kala1
                                                                        ? Colors
                                                                            .grey
                                                                        : Colors
                                                                            .blueGrey
                                                                            .shade50,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 0,
                                                                ),
                                                                Text(
                                                                  info3.map((u) => u['title'].contains('message') && u['whoiswho'] == ry['id'].toString()).toSet().toList().map((c) {}).length ==
                                                                          1
                                                                      ? ""
                                                                      : info3
                                                                          .where((u) =>
                                                                              u['title'].contains('message') &&
                                                                              u['whoiswho'] ==
                                                                                  ry['id'].toString())
                                                                          .length
                                                                          .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize: 12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: !widget.kala1
                                                                        ? Colors
                                                                            .blueGrey
                                                                            .shade900
                                                                        : Colors
                                                                            .white,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .6,
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  ry['date']
                                                                              .split('|')[
                                                                                  0]
                                                                              .toString() ==
                                                                          now
                                                                              .toString()
                                                                      ? "Today at " +
                                                                          ry['date']
                                                                              .split('|')[
                                                                                  1]
                                                                              .toString()
                                                                      : ry['date']
                                                                              .split('|')[
                                                                                  0]
                                                                              .toString() +
                                                                          " at " +
                                                                          ry['date']
                                                                              .split('|')[1]
                                                                              .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize: 10,
                                                                    color: widget
                                                                            .kala1
                                                                        ? Colors.grey[
                                                                            300]
                                                                        : Colors.grey[
                                                                            500],
                                                                  ),
                                                                ),
                                                              ]),
                                                        )
                                                      ]),
                                                ),
            
                                                //heey
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 5),
                                                    child: Container(
                                                      height: 0.1,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              8,
                                                      color: widget.kala1
                                                          ? Colors.grey[300]
                                                          : Colors.grey[500],
                                                    ),
                                                  ),
                                                ),
                                              ])),
                                        )
                                      : Container(
                                          //xnm.toString()
                                          // child: Text(xnm +
                                          //   ('1 blue' == '$xnm')
                                          //      .toString()) //'1 blue'==ry['to'].split(',')[0].toString().replaceAll('[', '').toString()).toString()),
                                          //child:  Text(Type(ry['to'].split(',')[0].toString().replaceAll('[', '').toString().replaceAll(' ', ''), [widget.klass.toString().replaceAll(',', '').replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '')]) .toString()+" "+ry['to'].split(',')[0].toString().replaceAll('[', '').toString()+ " "+widget.klass.toString().replaceAll(',', '').replaceAll('(', '').replaceAll(')', '').toString()),
            
                                          ))
                                  .toList()
                        ],
                      ),
                    ),
                  )*/
                ]),
              ),
            );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
