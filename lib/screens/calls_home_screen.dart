import 'package:flutter/material.dart';
import 'new_message_call.dart';

class CallsHomeScreen extends StatefulWidget {
  @override
  _CallsHomeScreenState createState() => _CallsHomeScreenState();
}

class _CallsHomeScreenState extends State<CallsHomeScreen>
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
      body: Center(child: Text("CHATS")),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_call,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewContactScreen("call");
            }));
          }),
    );
  }
}
