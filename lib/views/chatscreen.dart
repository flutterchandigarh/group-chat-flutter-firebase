import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app/helper_functions/shared_preference_helper.dart';

class ChatScreen extends StatefulWidget {
  final String title, desc;
  ChatScreen({this.title, this.desc});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = new TextEditingController();

  addMesage() async {
    FirebaseFirestore.instance
        .collection("groupchats")
        .doc("TrPM8kYZo093F6aiczhl")
        .collection("chats")
        .add({
      "create_ts": DateTime.now().millisecondsSinceEpoch,
      "message": textEditingController.text,
      "user_profile_pic": await SharedPreferenceHelper.getUserProfilePic(),
      "username": await SharedPreferenceHelper.getUserName()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title),
              Text(
                widget.desc,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("groupchats")
                  .doc("TrPM8kYZo093F6aiczhl")
                  .collection("chats")
                  .orderBy("create_ts", descending: false)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 8),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds =
                                snapshot.data.documents[index];
                            return ChatMessageTile(
                              message: ds["message"],
                              timeago: ds["create_ts"],
                              profileUrl: ds["user_profile_pic"],
                              name: ds["username"],
                            );
                          },
                        ),
                      )
                    : Container(
                        child: Center(child: CircularProgressIndicator()),
                      );
              },
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                  hintText: "Message ...",
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  border: InputBorder.none))),
                      SizedBox(width: 16),
                      GestureDetector(
                          onTap: () {
                            addMesage();
                            textEditingController.text = "";
                          },
                          child: Container(child: Icon(Icons.send)))
                    ],
                  )),
            ),
          ],
        ));
  }
}

class ChatMessageTile extends StatelessWidget {
  final String name, profileUrl, message;
  final int timeago;
  ChatMessageTile({this.name, this.profileUrl, this.timeago, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                profileUrl,
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Color(0xffF1F0F0),
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 15),
                ))
          ],
        ));
  }
}
