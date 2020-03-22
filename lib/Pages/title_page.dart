import 'package:flutter/material.dart';
import 'package:chat_app/HelperWidgets/route_animations.dart';
import 'package:chat_app/Pages/chat_page.dart';

class TitlePage extends StatelessWidget {
  TitlePage({Key key}) : super(key: key);

  void toSearchPage(BuildContext context) {
    Navigator.of(context).push(FadeInRoute(nextPage: ChatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text("COVIDsation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor)),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
              child: Text("This service connects you with another random person in isolation due to the COVID-19 pandemic. Press Search to begin.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            RaisedButton(
                onPressed: () => toSearchPage(context),
                child: Text(
                  "Search",
                  style: TextStyle(fontSize: 20),
                )
            ),
          ],
        ),
      ),
    );
  }
}