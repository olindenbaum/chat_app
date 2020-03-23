import 'package:flutter/material.dart';
import 'package:chat_app/Chat/chat_client.dart';

class ChatBox extends StatefulWidget {
  ChatBox({Key key, ChatClient chatClient}) : super(key: key);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  ChatClient socketClient;
  List<ChatMessage> messages;
  User clientUser; // For now stores which user is the client (host) user but this may need changing

  @override
  void initState() {
    super.initState();

    // For testing purposes, two users are generated
    User bob = new User("1", "Bob");
    User fred = new User("2", "Fred");
    clientUser = bob;
    // Create chat client here - for now create some basic messages;
    messages = [ChatMessage(bob, "Hello"), ChatMessage(bob, "Hi"), ChatMessage(fred, "Hey"), ChatMessage(bob, "Bye")];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColorLight, width: 2)),
              constraints: BoxConstraints(maxWidth: 1000, maxHeight: 700),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) => createChatMessageUI(index)
              ),
            ),
          ),
        ],
      ),
    );
  }

  ChatMessageUI createChatMessageUI(int index) {
    ChatMessage message = messages[index];

    bool isClient = false;
    if(message.getUser() == clientUser) {
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
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: isClient ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 4, right: 5),
            child: Text(user.getUsername(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 2, bottom: 2),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: isClient ? Theme.of(context).primaryColor : Theme.of(context).primaryColor, // Need an alternate color for other user's messages
                ),
                child: Text(this.message, style: TextStyle(fontSize: 15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}