import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final List chats;
  final String lastText;
  final String lastTextTime;
  final String name;
  final String user;
  final String val;

  ChatModel({
    required this.chats,
    required this.lastText,
    required this.lastTextTime,
    required this.name,
    required this.user,
    required this.val,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastText": lastText,
        "lastTextTime": lastTextTime,
        "Chats": chats,
        "user": user,
        "val": val,
      };

  factory ChatModel.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ChatModel(
      name: snapshot["name"],
      lastText: snapshot["lastText"],
      lastTextTime: snapshot["lastTextTime"],
      chats: snapshot["Chats"],
      user: snapshot["user"],
      val: snapshot["val"],
    );
  }
}
