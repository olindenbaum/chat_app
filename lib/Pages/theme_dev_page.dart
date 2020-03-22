import 'package:flutter/material.dart';

class MyThemeDevPage extends StatefulWidget {
  MyThemeDevPage({Key key}) : super(key: key);


  @override
  _MyThemeDevPageState createState() => _MyThemeDevPageState();
}

class _MyThemeDevPageState extends State<MyThemeDevPage> {
  bool switchValue = true;

  void _showDialog(String msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Theme dev page"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Icon',
            ),
            Icon(Icons.accessibility_new),
            Text(
              'Image',
            ),
            Image.asset('images/hackQuarantine.png'),

            RaisedButton(
              child: Text(
              'RaisedButton',
              ), onPressed: () {
                _showDialog("raised button pressed");
              },
            ),

            Text(
              'Switch',
            ),
            Switch(onChanged: (bool value) {switchValue = !switchValue;}, 
            value: switchValue,

              
            ),

            Text(
              'TextField',
            ),
            TextField(
              decoration: InputDecoration(labelText: 'input field'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
          _showDialog("floating button pressed");
        },
      ),
    );
  }
}
