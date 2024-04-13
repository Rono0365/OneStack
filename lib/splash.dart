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
    return 
    SizedBox(
        child: Stack(children: [
      SizedBox.expand(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
          child: Image.asset(
            'assets/forthepeople.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
            child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           //   mainAxisAlignment: MainAxisAlignment.canter,
         children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.35,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Image.asset('assets/newstack-logo.png'),
              ),
            ),
            Center(
              child:Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text(
                    "One",
                    style: GoogleFonts.rubik(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Stack",
                    style: GoogleFonts.rubik(
                      fontSize: 27,
                      color: Colors.cyan.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
            ),


            Text(""),
            Text("Made For Humans", style:
                                                      GoogleFonts.inconsolata(
                                                    color: Colors.grey,
                                                    //backgroundColor: Colors.black,
                                                  ),)
           
           
          ],
        )),
      ),
        ) ]) );
  }
}
