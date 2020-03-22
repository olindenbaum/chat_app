import 'package:flutter/material.dart';
import 'package:chat_app/Chat/chat_box.dart';


class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ChatBox();
  }
}

