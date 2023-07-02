import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'login.dart';

class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  void initState() {
    super.initState();
    _navtohome();
  }

  _navtohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MyAppL(title: ''))); //MyHomePage(title: "myRiara")
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Image.asset('assets/icon1.png'),
            ),
          ),
         
         
        ],
      )),
      bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.width * 0.10,
          //width: MediaQuery.of(context).size.width * 0.20,
          child: Text(
            "",
            style: TextStyle(fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          )),
    );
  }
}
