import 'package:flutter/material.dart';
import 'package:group_chat_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          Center(
            child: RaisedButton(
                onPressed: () {
                  AuthMethods().signInWithGoogle(context);
                },
                child: Text("Sign in with Google")),
          )
        ],
      ),
    );
  }
}
