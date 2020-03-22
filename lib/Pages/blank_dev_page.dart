import 'package:flutter/material.dart';

class MyBlankDevPage extends StatefulWidget {
  MyBlankDevPage({Key key}) : super(key: key);


  @override
  _MyBlankDevPageState createState() => _MyBlankDevPageState();
}

class _MyBlankDevPageState extends State<MyBlankDevPage> {
  bool switchValue = true;

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
      appBar: AppBar(
        title: Text("Blank dev page"),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text("Blank Page"),
        ],)
        ),
    );
  }
}
