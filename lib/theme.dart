import 'package:flutter/material.dart';
//TODO change values
ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.lightBlue,
  brightness: Brightness.dark,
  accentColor: Colors.lightBlueAccent,
  textTheme: TextTheme(
      title: TextStyle(color: Color(0xff40bf7a)),
      subtitle: TextStyle(color: Colors.white),
      subhead: TextStyle(color: Color(0xff40bf7a))),
  appBarTheme: AppBarTheme(color: Color(0xff1f655d)));

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    accentColor: Colors.lightBlueAccent,
    textTheme: TextTheme(
        title: TextStyle(color: Colors.black54),
        subtitle: TextStyle(color: Colors.grey),
        subhead: TextStyle(color: Colors.white)),
    appBarTheme: AppBarTheme(
        color: Color(0xff1f655d),
        actionsIconTheme: IconThemeData(color: Colors.white)));