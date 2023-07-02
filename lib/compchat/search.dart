import 'package:flutter/material.dart';
import 'mess.dart';

class searchQ extends StatefulWidget {
  searchQ(
      {Key? key,
      required this.misearch,
      required this.username,
      required this.kala1,
      required this.profpic,
      required this.token})
      : super(key: key);
  List misearch;
  List profpic;
  bool kala1;
  String username;
  String token;
  @override
  State<searchQ> createState() => _searchQState();
}

class _searchQState extends State<searchQ> {
  final titleController = TextEditingController();
  List ronox = [];

  /* */
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List rono = widget.misearch;
    bool woz = true; //yea i was listening to steve wozniak

    void sq(List x) {
      setState(() => ronox = x);
      print(ronox);

      //rono was here 5/20/22~2:29am
    }

    @override
    void initState() {
      super.initState();
      titleController.text = '';
      print('search bar' + titleController.text);
    }

    return Scaffold(
        backgroundColor: widget.kala1
                                  ? Colors.black
                                  : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0), // here the desired height
          child: AppBar(
            //backgroundColor: Colors.white,

            elevation: 0.0,
            backgroundColor: widget.kala1
                                  ? Colors.black
                                  : Colors.white,
            leading: Container(),
            centerTitle: true,
            flexibleSpace: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(),
                  Container(
                    //height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        style: TextStyle(color: !widget.kala1
                                  ? Colors.black
                                  : Colors.white,),
                        onTap: () {
                          woz = true;

                          sq(rono
                              .where(
                                (x) => x['username'].toLowerCase().contains(''),
                                //print(x);
                              )
                              .toList());
                        },
                        //actions:[],
                        onChanged: (text) {
                          woz = true;

                          sq(rono
                              .where(
                                (x) => x['username']
                                    .toLowerCase()
                                    .contains(text.toLowerCase()),
                                //print(x);
                              )
                              .toList());

                          print("can't get this" + rono.toString());
                        },
                        autofocus: false,
                        controller: titleController,
                        decoration: InputDecoration(
                          
                            prefixIcon: Icon(Icons.search,color: !widget.kala1
                                  ? Colors.black
                                  : Colors.white,),
                            suffixIcon: woz
                                ? InkWell(
                                    child: Icon(Icons.close,color:!widget.kala1
                                  ? Colors.black
                                  : Colors.white,),
                                    onTap: () {
                                      //woz = true;

                                      titleController.clear();
                                      titleController.text = '';
                                      print('was here');
                                    },
                                  )
                                : Container(),
                            filled: true,
                            fillColor: !widget.kala1
                                  ? Colors.white30
                                  : Colors.white30,
                            //fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60.0)),
                            //labelText: 'Search',
                            hintText: 'Search ...'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: ronox != ''
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    //Text('xcd' + ronox.toString()),
                    ...ronox.map((i) => i['username'] != widget.username
                        ? ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FriendMess(
                                    title: i['username'].toString(),
                                    //code: i['code'].toString(),
                                    token: widget.token,
                                    myname: '',
                                    user: widget.username, newc: [], repl: '',
                                  ),
                                ), //MaterialPageRoute
                              );
                              /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Rutimetable(
                                    title: (rono.indexOf(i) + 1).toString(),
                                    token: widget.token.toString(),
                                    user: "Menu",
                                    me: widget.username
                                        .toString()), // sky2['username']
                              ),
                            );*/
                            },
                            leading: Container(
                                child: Stack(children: [
                              ...widget.profpic.map(
                                (ui) => ui['username1'] == "${i['username']}"
                                    ? CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,

                                        backgroundImage: NetworkImage(
                                          ui['image'],
                                        ), //ui['image'],
                                      )
                                    : SizedBox(),
                              ),
                            ])),
                            subtitle: Text(
                              "${i['Class']}",
                              style: TextStyle(color: !widget.kala1
                                  ? Colors.black
                                  : Colors.white,),
                            ),
                            title: Text(
                              "${i['username']}",
                              style: TextStyle(color: !widget.kala1
                                  ? Colors.black
                                  : Colors.white,),
                            ),
                            trailing: CircleAvatar(
                                radius: 13,
                                //backgroundColor: Colors.yellow[700],
                                child: Center(
                                    child: RotatedBox(
                                        quarterTurns: 90,
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 12,
                                          color: Colors.white,
                                        )))),
                          )
                        : SizedBox()),
                  ],
                ),
              )
            : Scaffold(
                body: Column(
                children: [
                  ...rono.take(6).map((c) => ListTile(
                        title: Text('${c}',style: TextStyle(color:!widget.kala1
                                  ? Colors.black
                                  : Colors.white,),),
                      )),
                ],
              )));
  }
}
