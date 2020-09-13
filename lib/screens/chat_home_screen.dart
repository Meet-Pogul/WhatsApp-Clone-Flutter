import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'new_message_call.dart';

class ChatHomeScreen extends StatefulWidget {
  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewContactScreen("message");
            }));
          }),
      body: allChatsHome(),
    );
  }

  Widget allChatsHome() {
    return ListView(
      children: [contactLayout()],
    );
  }

  Widget contactLayout() {
    return GestureDetector(
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              "N",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(
            "Name",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          )),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatScreen();
        }));
      },
    );
  }
}
