import 'package:flutter/material.dart';

class FadeInRoute extends PageRouteBuilder {
  final Widget nextPage;

  FadeInRoute({this.nextPage}) : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation) => nextPage,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) =>
        FadeTransition(
          opacity: new Tween<double>(
              begin: 0,
              end: 1
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: nextPage,
        ),
  );
}

class PushUpRoute extends PageRouteBuilder {
  final Widget prevPage;
  final Widget nextPage;

  PushUpRoute({this.prevPage, this.nextPage}) : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation) => nextPage,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) =>
        Stack(children: <Widget>[
          SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: const Offset(0.0, -1.0),
            ).animate(animation),
            child: prevPage,
          ),
          SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: nextPage,
          )
        ],
        ),
  );
}