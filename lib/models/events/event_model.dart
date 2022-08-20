import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String uid,
      title,
      description,
      church,
      postId,
      startDate,
      endDate,
      startTime,
      endTime;
  final List attending;
  final bool isDone;

  EventModel({
    required this.uid,
    required this.title,
    required this.description,
    required this.postId,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    this.isDone = false,
    required this.church,
    required this.attending,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "title": title,
        "description": description,
        "startDate": startDate,
        "startTime": startTime,
        "endDate": endDate,
        "endTime": endTime,
        "isDone": isDone,
        "church": church,
        "attending": attending,
        "postId": postId
      };

  factory EventModel.fromSnapshot(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return EventModel(
      uid: snap["uid"],
      title: snap["title"],
      description: snap["description"],
      postId: snap["postId"],
      startDate: snap["startDate"],
      startTime: snap["startTime"],
      endDate: snap["endDate"],
      endTime: snap["endTime"],
      isDone: snap["isDone"],
      church: snap["church"],
      attending: snap["attending"],
    );
  }
}
