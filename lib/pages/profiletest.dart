import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class proftest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("xon"),
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                 
              ),
            ),
            SliverToBoxAdapter(
             
              child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                              //leading:
                              title: Row(children: [
                                Container(
                                  child: Stack(children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.grey,
                                      child: Center(
                                        child: Text("widget.username"
                                            .toString()
                                            .substring(0, 1)),
                                      ),
                                    ),
                                   
                                  ]),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            title: Container(
                                              child: Text("text")
                                            ),
                                            subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "@est",
                                                    style: GoogleFonts.rubik(
                                                        //fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey),
                                                  ),
                                                ]),
                                          ),
                                        ]))
                              ]),
                              trailing: Container(
                                  child: InkWell(
                                onTap: () {
                                 // scanbadge();
                                },
                                child: Icon(
                                  Icons.qr_code_2,
                                  color: Colors.grey,
                                ),
                              ))),
                        ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item $index')),
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
