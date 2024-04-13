import "package:flutter/material.dart";

import "../widgets/widget4.dart";

//import 'menu.dart';

class searchQ extends StatefulWidget {
  searchQ(
      {Key? key,
      required this.misearch,
      required this.username,
      
      
      required this.profpic,
      required this.token})
      : super(key: key);
  List misearch;
  String username;
  
 
  List profpic;

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

      //rono was here 8/30/23~8:22pm
    }

    @override
    void initState() {
      super.initState();
      titleController.text = '';
      print('search bar' + titleController.text);
    }

    return Scaffold(
        backgroundColor: Colors.black,
        
        body: ronox != ''
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(),
                    SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        onTap: () {
                          woz = true;

                          sq(rono
                              .where(
                                (x) => x['title'].toLowerCase().contains(''),
                                //print(x);
                              )
                              .toList());
                        },
                        //actions:[],
                        onChanged: (text) {
                          woz = true;

                          sq(rono
                              .where(
                                (x) => x['title']
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
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: woz
                                ? InkWell(
                                    child: Icon(Icons.close),
                                    onTap: () {
                                      //woz = true;

                                      titleController.clear();
                                      titleController.text = '';
                                      print('was here');
                                    },
                                  )
                                : Container(),
                            filled: true,
                            //fillColor: Colors.grey[100],
                            fillColor: Colors.grey[900],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60.0)),
                            //labelText: 'Search',
                            hintText: 'Search for events'),
                      ),
                    ),
                  ),
                  Container(height:10),
                    //Text('xcd' + ronox.toString()),
                    ...ronox
                        .where((e) => e['title'] != "")
                        .map((i) => eventwidget(
                                                  eventdate: DateTime.parse(
                                                      "${i["date"]}"),
                                                  eventowner:
                                                      "${i["username"]}",
                                                  eventloc: "${i["location"]}",
                                                  numb: ronox.indexOf(i),
                                                  eventpic:
                                                      widget.profpic, //get  username id
                                                  eventtitle: "${i["title"]}",
                                                )),
                  ],
                ),
              )
            : Scaffold(
                body: Column(
                children: [
                  ...rono.take(6).map((c) => ListTile(
                        title: Text('bb${c}'),
                      )),
                ],
              )));
  }
}
