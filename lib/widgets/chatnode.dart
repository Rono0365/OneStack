import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  final String username;
  final String timeframe;
  final String message;
  final List pics;

  const ChatBubble({
    Key? key,
    required this.username,
    required this.timeframe,
    required this.message,
    required this.pics,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Text(
                  username,
                  style: GoogleFonts.rubik(
                        fontWeight: FontWeight.normal, color: Colors.white),
                ),*/
                SizedBox(height: 4.0),
                /*Text(
                  timeframe,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),*/
                //SizedBox(height: 4.0),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  
                   constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey.shade900,
                                                      border: Border.all(
                                                          color:  Colors.cyan.shade600),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                               
                                                                     20.0),
                                                      ),
                                                      
                                                    ),
                  
                  child: Text(
                    message,
                    style:  GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
