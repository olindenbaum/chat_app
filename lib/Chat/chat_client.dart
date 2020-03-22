// CHAT_CLIENT: Backend code for handling chat conversations - includes socket
// code, as well as User and ChatMessage wrapper classes (no UI)

import 'dart:io';
import 'dart:async';
import 'package:quiver/core.dart' show hash2;

class ChatClient {
  final String host = "localhost";
  final int port = 53157;
  Socket s;

  void dataHandler(data) {
    print(data);
  }

  void errorHandler(error, StackTrace trace) {
    print(error);
  }

  void cleanup() {
    s.destroy();
  }

  void connectToServer() async {
    s = await Socket.connect(host, port).catchError((AsyncError e) {
      print("Unable to connect: $e");
    });
    s.listen(dataHandler,
        onError: errorHandler,
        onDone: cleanup,
        cancelOnError: false);

    s.write("Jeff");
    // Server should return a list of uuids and names, each one is assigned to a new user
  }
}

class User {
  int _userID;
  String _name;

  User(int userID, String userName) {
    _userID = userID;
    _name = userName;
  }

  bool operator ==(other) { // Override == to compare users easily
    return (this._userID == other.getUserID()); // Clearly don't try to compare with something that isn't a user.
  }

  int get hashCode => _userID.hashCode; // Override hashCode because overriding equals

  int getUserID() {
    return _userID;
  }

  String getUsername() {
    return _name;
  }
}

class ChatMessage {
  User _user;
  String _messageString;

  ChatMessage(User user, String message) {
    _user = user;
    _messageString = message;
  }

  User getUser() {
    return _user;
  }

  String getMessageString() {
    return _messageString;
  }

  bool operator ==(other) {
    if (_user == other.getUser() && _messageString == other.getMessageString()) {
      return true;
    }
    return false;
  }

  int get hashCode => hash2(_user, _messageString);
}