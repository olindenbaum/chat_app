import 'package:flutter/material.dart';
import 'package:chat_app/HelperWidgets/loading_animation.dart';
import 'package:chat_app/HelperWidgets/route_animations.dart';
import 'package:chat_app/Pages/chat_page.dart';
import 'package:chat_app/Chat/chat_client.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.username}) : super(key: key);

  final String username;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  ChatClient socketClient;
  String ip = "not yet";

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1750));
    _controller.repeat();

    socketClient = ChatClient(this.widget.username);
    socketClient.addFoundRoomListener(foundRoom);
    print("connecting to server");
    socketClient.connectToServer();
  }

  void foundRoom() {
    Navigator.of(context).push(FadeInRoute(nextPage: ChatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // TODO: use willPopScope to clean up correctly when back button pressed (i.e: close connection to server cleanly)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20), child: Text("Searching...", style: TextStyle(fontSize: 15))),
            CubeGridAnimation(color: Theme.of(context).primaryColor, controller: _controller),
            Text(ip),
        ]),
    ),
    );
  }
}
