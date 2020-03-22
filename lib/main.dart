import 'package:flutter/material.dart';
import 'package:chat_app/Pages/title_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  // This widget is the root of your application.

  final darkTheme = ThemeData(
    primarySwatch: Colors.lightBlue,
    primaryColor: Colors.lightBlue,
    brightness: Brightness.dark,
    accentColor: Colors.lightBlueAccent,
    fontFamily: "OpenSans",
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    accentColor: Colors.lightBlueAccent,
    fontFamily: "OpenSans",

  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: darkTheme,
      home: TitlePage(),
    );
  }
}


