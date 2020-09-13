import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/camera_home_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController _textEditingController = new TextEditingController();
  String abc = "";

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
        titleSpacing: -25.0,
        title: ListTile(
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
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        actions: [
          Icon(Icons.videocam),
          Padding(padding: EdgeInsets.only(right: 22.0)),
          Icon(Icons.call),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          Icon(Icons.more_vert),
          Padding(padding: EdgeInsets.only(right: 5.0)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images\\chat-screen-wallpaper.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: sender(),
      ),
    );
  }

  Widget sender() {
    return ListView(
      reverse: true,
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.insert_emoticon,
                    ),
                    onPressed: null,
                  ),
                  Padding(padding: EdgeInsets.only(right: 5.0)),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Type a message",
                      ),
                      controller: _textEditingController,
                      onSubmitted: _sendMessage,
                      onChanged: (value) {
                        setState(() {
                          abc = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.black38,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CameraHomeScreen();
                      }));
                    },
                  ),
                ],
              ),
            )),
            micSender(),
          ],
        ),
      ],
    );
  }

  void _sendMessage(String value) {
    debugPrint(value);
    _textEditingController.clear();
  }

  Widget micSender() {
    if (abc != "") {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            Icons.send,
            color: Colors.white,
          ),
          onPressed: () => _sendMessage(_textEditingController.text),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            Icons.mic,
            color: Colors.white,
          ),
          onPressed: null,
        ),
      );
    }
  }
}
