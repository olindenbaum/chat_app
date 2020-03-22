import 'package:chat_app/Pages/blank_dev_page.dart';
import 'package:chat_app/Pages/theme_dev_page.dart';
import 'package:flutter/material.dart';

import '../HelperWidgets/route_animations.dart';


class DevPage extends StatefulWidget {
  DevPage({Key key}) : super(key: key);

  @override
  _DevPageState createState() => _DevPageState();
}

class _DevPageState extends State<DevPage> {

  void _showDialog(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text(msg),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Column(children: <Widget>[
        RaisedButton(
          onPressed: () => Navigator.of(context).push(FadeInRoute(nextPage: MyThemeDevPage())),
          child: Text(
                  "Themes",
                  style: TextStyle(fontSize: 20),
                )
        ),
         RaisedButton(
          onPressed: () => Navigator.of(context).push(FadeInRoute(nextPage: MyBlankDevPage())),
          child: Text(
                  "Blank Dev Page",
                  style: TextStyle(fontSize: 20),
                )
        ),
        RaisedButton(
          onPressed: () => _showDialog("This button does nothing"),
          child: Text(
                  "EDIT ME TO ADD NEW DEV PAGES",
                  style: TextStyle(fontSize: 20),
                )
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,)]))
    );
  }
}

