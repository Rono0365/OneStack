import "package:flutter/material.dart";

import "../widgets/widget1.dart";

class hp extends StatefulWidget {
  const hp(
      {Key? key, required this.l1,required this.token,required this.pic_url, required this.b1, required this.l2, required this.username})
      : super(key: key);
  final List l1;
  final List l2;
  final List b1;
  final String username;
   final List pic_url;
   final String token;

  @override
  State<hp> createState() => _hpState();
}

class _hpState extends State<hp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slicer(information.reversed.where((u) => u != null).toList())
        /*
        getLikesByUsername(sky2, widget.username.toString())
                        .reversed
                        .take(1)
                        .toString()
                        .replaceFirst("[", "")
                        .replaceFirst("]", "")
                        .replaceAll(" ", "")
                        .split(",")
                        .contains(x["whoiswho"].toString().replaceAll(' ', '')
        */
        ...widget.l1.map((x) => //get the preffered topics
                // == "IOT"
                widget.b1.contains(x["whoiswho"].toString().replaceAll(' ' ,''))
                    ? homewidget(
                        time1:
                            "${x["date"].split("|")[0].split(" ")[1].toString()} "
                            "${x["date"].split("|")[0].split(" ")[2]}",
                        time2: x["date"].toString(),
                        imagez:
                            x["image"] != "notitle" ? x["image"] : "notitle",
                        imagez1:
                            x["image"] != "notitle" ? x["image"] : "notitle",   
                        imagez2:
                            x["image"] != "notitle" ? x["image"] : "notitle",   
                            imagez3:
                            x["image"] != "notitle" ? x["image"] : "notitle",  
                         
                        name: x["writer"],
                        title: x["mation"],
                        chip: x["whoiswho"].toString(),
                        postdata: widget.l2,
                        peoplex: widget.l2
                                    .map((u) =>
                                        u['title'].contains('message') &&
                                        u['whoiswho'] == x['id'].toString())
                                    .toSet()
                                    .toList()
                                    .map((c) {})
                                    .length ==
                                1
                            ? []
                            : widget.l2
                                .where((u) =>
                                    u['title'].contains('message') &&
                                    u['whoiswho'] == x['id'].toString())
                                .toList(),
                        people: widget.l2
                                    .map((u) =>
                                        u['title'].contains('message') &&
                                        u['whoiswho'] == x['id'].toString())
                                    .toSet()
                                    .toList()
                                    .map((c) {})
                                    .length ==
                                1
                            ? ""
                            : widget.l2
                                .where((u) =>
                                    u['title'].contains('message') &&
                                    u['whoiswho'] == x['id'].toString())
                                .length
                                .toString(),
                        Id: x["id"].toString(),
                        token: widget.token,
                        myusername: widget.username.toString(),
                        image: widget.pic_url,
                        text: '',
                      )
                    : Container()

            //.contains(x["whoiswho"])

            ),
        /*ListTile(
          title: InkWell(
              onTap: () {
                setState(() {
                  zxx * 2;
                });
              },
              child: Column(
                children: [
                  Container(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      )),
                ],
              )),
        ),*/
        ListTile(),
        ListTile(),
        ListTile()
      ],
    );
  }
}
