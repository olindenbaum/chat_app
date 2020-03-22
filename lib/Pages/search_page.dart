import 'package:flutter/material.dart';
import 'package:chat_app/HelperWidgets/loading_animation.dart';
//import 'package:test_app/HelperWidgets/route_animations.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  bool foundMatch = true;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1750));
    _controller.repeat();
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
        ]),
    ),
    );
  }
}
