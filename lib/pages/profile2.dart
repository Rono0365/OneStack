import 'package:OneStack/pages/profile.dart';
import 'package:flutter/material.dart';

class profile2 extends StatefulWidget {
  profile2(
      {Key? key,
      required this.username,
      required this.token,
      required this.information,
      required this.unfo,
      required this.userid})
      : super(key: key);
  String username;
  String token;
  var information;
  String userid;
  final unfo;
  @override
  State<profile2> createState() => _profile2State();
}

class _profile2State extends State<profile2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 150.0, // Initial height of the app bar
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://example.com/image.jpg', // Replace with your desired image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return profile(
                    information: widget.information,
                    username: widget.username,
                    userid: int.parse(widget.userid),
                    token: widget.token,
                    pics: [],
                    unfo: widget.unfo,
                  );
                },
                childCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
