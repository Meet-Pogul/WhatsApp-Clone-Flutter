import 'package:flutter/material.dart';
import 'screens/calls_home_screen.dart';
import 'screens/camera_home_screen.dart';
import 'screens/chat_home_screen.dart';
import 'screens/status_home_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with TickerProviderStateMixin {
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
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 2.0,
            tabs: <Widget>[
              Container(
                child: Tab(
                  icon: Icon(Icons.camera_alt),
                ),
              ),
              Container(
                child: Tab(
                  text: "CHATS",
                ),
              ),
              Container(
                child: Tab(
                  text: "STATUS",
                ),
              ),
              Container(
                child: Tab(
                  text: "CALLS",
                ),
              ),
            ],
          ),
          titleSpacing: 18.0,
          title: Container(child: Text('WhatsApp')),
          actions: <Widget>[
            Icon(Icons.search),
            Padding(padding: EdgeInsets.only(right: 15.0)),
            Icon(Icons.more_vert),
            Padding(padding: EdgeInsets.only(right: 5.0)),
          ],
        ),
        body: TabBarView(
          // controller: _tabController,
          children: <Widget>[
            CameraHomeScreen(),
            ChatHomeScreen(),
            StatusHomeScreen(),
            CallsHomeScreen(),
          ],
        ),
      ),
    );
  }
}
