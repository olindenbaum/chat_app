import 'package:chat_app/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Pages/title_page.dart';
import 'package:provider/provider.dart';

void main() {
  // ChangeNotifierProvider<ThemeModel>(
  //   builder: (BuildContext context) => ThemeModel(), child: ChatApp());

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
      // theme: Provider.of<ThemeModel>(context).currentTheme, // theme: Provider.of<ThemeModel>(context).toggleTheme()
      home: TitlePage(),
    );
  }
}


