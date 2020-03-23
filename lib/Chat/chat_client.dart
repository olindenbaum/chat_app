// CHAT_CLIENT: Backend code for handling chat conversations - includes socket
// code, as well as User and ChatMessage wrapper classes (no UI)

import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:quiver/core.dart' show hash2;

enum ChatClientStatus {
  Disconnected,
  WaitingForRoom,
  Connected
}

void main() {
  ChatClient c = new ChatClient("Bob");
  c.connectToServer();
}

class ChatClient {
  final String host = "localhost";
  final int port = 53157;
  ChatClientStatus status = ChatClientStatus.Disconnected;
  Socket s;

  String _username;
  User _clientUser;
  List<User> _room = new List<User>();
  List<Function> _foundRoomCallback = new List<Function>();
  List<Function> _messageCallback = new List<Function>();


  ChatClient(String name) {
    _username = name;
  }

  dataHandler(data) {
    Map <String, dynamic> packetMap = json.decode(new String.fromCharCodes(data).trim()); // Data is received as a list of character codes
    if (packetMap.containsKey("PACKET_TYPE")) {
      switch (packetMap["PACKET_TYPE"]) {
        case "CONFIRM_CONNECTION": // After client connects server returns a confirmation with the client's assigned UUID.
          this.confirmConnection(packetMap);
          break;
        case "ROOM_USERNAMES":
          this.createRoom(packetMap);
          break;
        case "MESSAGE":
          this.handleMessage(packetMap);
          break;
      }
    }
  }

  void confirmConnection(Map<String, dynamic> packetMap) {
    status = ChatClientStatus.WaitingForRoom;
    _clientUser = new User(packetMap["user_UUID"], _username);
    _room.add(_clientUser);
  }

  void createRoom(Map<String, dynamic> packetMap) {
    print("Got a room");
    for (int i = 0; i < packetMap["num_users"]; i++) {
      User newUser = new User(packetMap[("user" + i.toString() + "_UUID")], packetMap[("user" + i.toString() + "_name")]);
      if (newUser != _clientUser) {
      _room.add(newUser);
      }
    }
    print(_room.toString());
    status = ChatClientStatus.Connected;

    for (int i = 0; i < _foundRoomCallback.length; i++) {
    _foundRoomCallback[i]();
    }
  }

  void addFoundRoomListener(Function listener) {
    _foundRoomCallback.add(listener);
  }

  void handleMessage(Map<String, dynamic> packetMap) {
    ChatMessage newMessage = new ChatMessage(packetMap["message_user"], packetMap["message_text"]);

    for (int i = 0; i < _messageCallback.length; i++) {
      _messageCallback[i](newMessage);
    }
  }

  void addMessageListener(Function listener) {
    _messageCallback.add(listener);
  }

  void errorHandler(error, StackTrace trace) {
    print(error);
  }

  void cleanup() {
    s.destroy();
  }

  void sendJsonMap(Map<String, dynamic> jsonData) {
      s.write(json.encode(jsonData));
  }

  void connectToServer() async { // Connects to the server and sends client information.
    print("running function");
    s = await Socket.connect(host, port).catchError((e) {
      print("Caught error: $e");
    });
    s.listen(dataHandler,
        onError: errorHandler,
        onDone: cleanup,
        cancelOnError: false);

    sendJsonMap({"PACKET_TYPE" : "CLIENT_USERNAME", "username" : _username});
    print("sending to server");
  }

  User getClient() {
    return _clientUser;
  }

  ChatClientStatus getSearchStatus() {
    return status;
  }

  List<User> getRoom() {
    return _room;
  }
}

class User {
  String _userID;
  String _name;
  User(String userID, String userName) {
    _userID = userID;
    _name = userName;
  }

  bool operator ==(other) { // Override == to compare users easily
    return (this._userID == other.getUserID()); // Clearly don't try to compare with something that isn't a user.
  }

  int get hashCode => _userID.hashCode; // Override hashCode because overriding equals

  String getUserID() {
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