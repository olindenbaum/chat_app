import 'package:flutter/material.dart';
import 'package:chat_app/Chat/chat_client.dart';

class ChatBox extends StatefulWidget {
  ChatBox({Key key}) : super(key: key);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  ChatClient socketClient;
  User currentUser;
  List<ChatMessage> messages;

  @override
  void initState() {
    super.initState();

    // For testing purposes, two users are generated
    User bob = new User(1, "Bob");
    currentUser = bob;
    User fred = new User(2, "Fred");

    // Create chat client here - for now create some basic messages;
    messages = [ChatMessage(bob, "Hello"), ChatMessage(bob, "Hi"), ChatMessage(fred, "Hey"), ChatMessage(bob, "Bye")];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) => createChatMessageUI(index)
        )
      )
    );
  }

  ChatMessageUI createChatMessageUI(int index) {
    ChatMessage message = messages[index];

    bool isClient = false;
    if(message.getUser() == currentUser) {
      isClient = true;
    }

    return ChatMessageUI(user: message.getUser(), isClient: isClient, message: message.getMessageString());
  }

}

class ChatMessageUI extends StatelessWidget {
  final User user;
  final bool isClient;
  final String message;

  ChatMessageUI({Key key, this.user, this.isClient, this.message}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isClient ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          child: Text(user.getUsername(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
              child: Text(this.message, style: TextStyle(fontSize: 20)),
            )
          ),
        ),
      ],
    );
  }
}