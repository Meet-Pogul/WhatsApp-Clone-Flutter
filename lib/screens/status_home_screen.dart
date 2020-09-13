import 'package:flutter/material.dart';
import 'camera_home_screen.dart';

class StatusHomeScreen extends StatefulWidget {
  @override
  _StatusHomeScreenState createState() => _StatusHomeScreenState();
}

class _StatusHomeScreenState extends State<StatusHomeScreen>
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
            Icons.camera_alt,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CameraHomeScreen();
            }));
          }),
    );
  }
}
