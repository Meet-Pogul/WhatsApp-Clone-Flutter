import 'package:flutter/material.dart';

class NewContactScreen extends StatefulWidget {
  final String type;
  NewContactScreen(this.type);
  @override
  _NewContactScreenState createState() => _NewContactScreenState(type);
}

class _NewContactScreenState extends State<NewContactScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String type;

  _NewContactScreenState(this.type);
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
      appBar: AppBar(
        titleSpacing: 5.0,
        title: Container(child: Text('Select contact')),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(padding: EdgeInsets.only(right: 13.0)),
          Icon(Icons.more_vert),
          Padding(padding: EdgeInsets.only(right: 5.0)),
        ],
      ),
      body: Center(
        child: Text("Contacts"),
      ),
    );
  }
}
