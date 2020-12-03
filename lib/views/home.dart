import 'package:flutter/material.dart';
import 'package:group_chat_app/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Groupchati"),
            Text(
              ".web.app",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              child: Text(
                "Sign in with Google",
                style: TextStyle(fontSize: 16),
              )),
          RaisedButton(
              onPressed: () {
                AuthMethods().signInWithGoogle(context);
              },
              child: Text("Sign in with Google"))
        ],
      ),
    );
  }
}
