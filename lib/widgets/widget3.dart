import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class workwidget extends StatefulWidget {
   workwidget({ Key? key,
    required this.workowner,
    required this.worktitle,
    required this.workpic,
    required this.workloc,
    required this.worksalary,
    required this.skills,
    

   }) : super(key: key);
   final String workowner;
  final String worktitle;
  final List workpic;
  final List skills;
  //eventloc
  final String workloc;
  final String worksalary;

  @override
  State<workwidget> createState() => _workwidgetState();
}

class _workwidgetState extends State<workwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:8.0,right:8.0,bottom:4.0 ),
      child: Card(
        elevation: 0,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
          children: [
            Container(
              
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(children:[
        
                            CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey,
                                  child: null,
                                ),
                                ...widget.workpic
                          .where((c) => c['username1'] == widget.workowner.toString())
                          .map(
                            (ui) => CircleAvatar(
                              radius: 12,
                              //backgroundColor: Colors.cyan.shade600,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.transparent,
        
                                backgroundImage: NetworkImage(
                                  ui['image'].replaceAll(" ", ''),
                                ), //ui['image'],
                              ),
                            ),
                          ),
                                
                                
                                ]),Container(width: 13,),Text(widget.workowner.toString(),style: GoogleFonts.rubik(
                      fontWeight: FontWeight.normal, color: Colors.white),)],),
            ),
            
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Wrap(
                        children:[
                          Container(
                           
                            width: MediaQuery.of(context).size.width*.8,
                            child: ListTile(title:Text("${widget.worktitle}",
                            style: GoogleFonts.rubik(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19
                            
                            ),
                            
                            overflow: TextOverflow.ellipsis,),
                            subtitle:Text("${widget.workloc}", 
                            style: GoogleFonts.rubik(
                              color: Colors.grey,
                            //fontWeight: FontWeight.bold,
                            //fontSize: 19
                            
                            ),)
                            ),
                          ),
                        ]
                      ),
                    ),
                    
                     Card(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Wrap(alignment: WrapAlignment.start, children: [
                          ...widget.skills
                              .toString()
                              .replaceAll("[", "")
                              .replaceAll("]", "")
                              .replaceAll(" ", "")
                              .split(',')
                              //.take(5)
                              .map(
                                (e) => Container(
                                  color: Colors.transparent,
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Chip(
                                                        label: Text(
                                                      e.toString(),
                                                      style: GoogleFonts.rubik(
                                                          //fontSize: 15,
                                                          fontWeight: FontWeight.normal,
                                                          color: Colors.black),
                                                    ))),
                              ),
                        ]),]),
                      )
                    ),
                  
               
                      Container(
        
                        height: 0.5,
                       width: MediaQuery.of(context).size.width*.95,
                       color: Colors.grey,
                      ),
                      ListTile(
                        title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.attach_money,color:Colors.grey),
                 
                    
                    Container(width: 3,),Text("${widget.worksalary}",style: GoogleFonts.rubik(
                      fontWeight: FontWeight.normal, color: Colors.white),)],),
                      )
        
          ],
              ),
        ),));
  }
}