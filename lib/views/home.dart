import 'package:flutter/material.dart';
import 'package:group_chat_app/services/auth.dart';
import 'package:group_chat_app/views/chatscreen.dart';
import 'package:group_chat_app/views/signin.dart';

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
        actions: [
          GestureDetector(
            onTap: () async {
              await AuthMethods().signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [ChatListTile()],
        ),
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      title: "Learn Flutter Live 🔴",
                      desc: "Learn Flutter Live by Sanskar Tiwari",
                    )));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/image.jpeg",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Learn Flutter Live 🔴",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 4),
              Text("Learn Flutter Live by Sanskar Tiwari")
            ])
          ],
        ),
      ),
    );
  }
}
