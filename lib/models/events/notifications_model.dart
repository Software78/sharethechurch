import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  final String title, description, postId, church;


  NotificationsModel({
    required this.title,
    required this.description,
    required this.postId,
    required this.church,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,

        "church": church,
        "postId": postId,
      };

  factory NotificationsModel.fromSnapshot(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return NotificationsModel(
      title: snap["title"],
      description: snap["description"],

      postId: snap["postId"],
      church: snap['church'],
    );
  }
}
