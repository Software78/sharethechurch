import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharethechurch/main.dart';
import 'package:sharethechurch/models/notifications_model.dart';
import 'package:sharethechurch/models/user_model.dart';
import 'package:sharethechurch/utils/functions/dialog.dart';
import 'package:uuid/uuid.dart';

import '../../../models/chat_model.dart';
import '../../../models/event_model.dart';

class CloudDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addUserToDb(String uid, Map<String, dynamic> userJson) async {
    await _firestore.collection("users").doc(uid).set(userJson);
  }

  Future<UserModel> getUserInfo(String uid) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(uid).get();
    UserModel userModel = UserModel.fromSnap(snapshot);
    return userModel;
  }

  addEvent({
    required String title,
    required String description,
    required String startDate,
    required String startTime,
    required String endDate,
    required String endTime,
  }) async {
    var postId = const Uuid().v1();
    UserModel userModel = await getUserInfo(currentUser!["uid"]);

    EventModel event = EventModel(
      uid: userModel.uid,
      title: title.trim(),
      description: description.trim(),
      postId: postId,
      startDate: startDate,
      startTime: startTime,
      endDate: endDate,
      endTime: endTime,
      church: userModel.name,
      attending: [],
    );

    try {
      for (var i = 0; i < userModel.following.length; i++) {
        await _firestore
            .collection('users')
            .doc(userModel.following[i])
            .collection('events')
            .doc(postId)
            .set(event.toJson());
      }
      await _firestore
          .collection('users')
          .doc(userModel.uid)
          .collection('events')
          .doc(postId)
          .set(event.toJson());
    } catch (e) {
      showErrorSnackbar(e.toString());
    }
  }

  deleteEvent() {}

  Future<List<UserModel>> getRecipients() async {
    List<UserModel> list = [];
    try {
      UserModel userModel = await getUserInfo(currentUser!['uid']);
      for (var i = 0; i < userModel.following.length; i++) {
        UserModel user = await getUserInfo(userModel.following[i]);
        // print(user);
        list.add(user);
      }
    } catch (e) {
      print(e.toString());
    }

    return list;
  }

  Future getNotifications() async {
    return await _firestore
        .collection('users')
        .doc(currentUser!['uid'])
        .collection('notifications')
        .get();
  }

  Future getEvents() async {
    return await _firestore
        .collection('users')
        .doc(currentUser!['uid'])
        .collection('events')
        .where("isDone", isEqualTo: false)
        .get();
  }

  readNotification() {}

  sendNotification(String title, String description, String church) async {
    var postId = const Uuid().v1();

    NotificationsModel notifications = NotificationsModel(
      title: title,
      description: description,
      postId: postId,
      church: currentUser!['name'],
    );
    UserModel userModel = await getUserInfo(currentUser!["uid"]);
    try {
      for (var i = 0; i < userModel.following.length; i++) {
        await _firestore
            .collection('users')
            .doc(userModel.following[i])
            .collection('notifications')
            .doc(postId)
            .set(notifications.toJson());
      }
      await _firestore
          .collection('users')
          .doc(userModel.uid)
          .collection('notifications')
          .doc(postId)
          .set(notifications.toJson());
    } catch (e) {
      showErrorSnackbar(e.toString());
    }
  }

  Stream searchChurch(String text) {
    return _firestore
        .collection('users')
        .where("userTypeId", isEqualTo: 1)
        .where("keywords", arrayContains: text.toLowerCase())
        .snapshots();
  }

  Stream searchAllChurches() {
    return _firestore
        .collection('users')
        .where("userTypeId", isEqualTo: 1)
        .snapshots();
  }

  chatUser(
    String uid,
    String userName,
    String followerId,
    String followerName,
  ) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('chats')
          .doc(followerId)
          .set(
            ChatModel(
              chats: [],
              lastText: '',
              lastTextTime: '',
              name: followerName,
              user: followerId,
              val: 'val',
            ).toJson(),
          );
      await _firestore
          .collection('users')
          .doc(followerId)
          .collection('chats')
          .doc(uid)
          .set(
            ChatModel(
                    chats: [],
                    lastText: '',
                    lastTextTime: '',
                    name: currentUser!['name'],
                    user: currentUser!['uid'],
                    val: 'val')
                .toJson(),
          );
    } catch (e) {
      print(e);
    }
  }

  followChurch(String churchId) async {
    DocumentSnapshot userSnap =
        await _firestore.collection('users').doc(currentUser!['uid']).get();
    List userFollowing = (userSnap.data()! as dynamic)['following'];
    DocumentSnapshot churchSnap =
        await _firestore.collection('users').doc(churchId).get();
    List churchFollowing = (churchSnap.data()! as dynamic)['following'];
    if (userFollowing.contains(churchId) &&
        churchFollowing.contains(currentUser!['uid'])) {
      await _firestore.collection('users').doc(currentUser!['uid']).update({
        'following': FieldValue.arrayRemove([churchId])
      });
      await _firestore.collection('users').doc(churchId).update({
        'following': FieldValue.arrayRemove([currentUser!['uid']])
      });
    } else {
      await _firestore.collection('users').doc(currentUser!['uid']).update({
        'following': FieldValue.arrayUnion([churchId])
      });
      await _firestore.collection('users').doc(churchId).update({
        'following': FieldValue.arrayUnion([currentUser!['uid']])
      });
    }
  }

  markEventAsComplete(String postId) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(currentUser!['uid']).get();
    UserModel userModel = UserModel.fromSnap(snapshot);
    for (var i = 0; i < userModel.following.length; i++) {
      await _firestore
          .collection('users')
          .doc(userModel.following[i])
          .collection('events')
          .doc(postId)
          .update({'isDone': true});
    }
    await _firestore
        .collection('users')
        .doc(userModel.uid)
        .collection('events')
        .doc(postId)
        .update({'isDone': true});
  }

  Future getChatList() async {
    return await _firestore
        .collection('users')
        .doc(currentUser!['uid'])
        .collection('chats')
        .get();
  }

  getChat(String user) {
    return _firestore
        .collection('users')
        .doc(currentUser!['uid'])
        .collection('chats')
        .doc(user)
        .snapshots();
  }

  sendMessage(String text, String user, String recipientId) async {
    try {
      await _firestore
          .collection('users')
          .doc(currentUser!['uid'])
          .collection('chats')
          .doc(recipientId)
          .update({
        'Chats': FieldValue.arrayUnion(['1$text']),
        'lastText': text,
        'lastTextTime': '${DateTime.now().hour}:${DateTime.now().minute}'
      });
      await _firestore
          .collection('users')
          .doc(recipientId)
          .collection('chats')
          .doc(currentUser!['uid'])
          .update({
        'Chats': FieldValue.arrayUnion(['0$text']),
        'lastText': text,
        'lastTextTime': '${DateTime.now().hour}:${DateTime.now().minute}'
      });
    } catch (e) {
      showErrorSnackbar(e.toString());
    }
  }

  setCityAndState(String city, String state, String? uid) async {
    await _firestore.collection("users").doc(uid).update({
      "city": city,
      "state": state,
    });
  }

  attendEvent(EventModel eventModel) async {
    DocumentSnapshot? snapshot = await _firestore
        .collection('users')
        .doc(eventModel.uid)
        .collection('events')
        .doc(eventModel.postId)
        .get();
    List attending = (snapshot.data()! as dynamic)['attending'];
    if (attending.contains(currentUser!['uid'])) {
      await _firestore
          .collection('users')
          .doc(eventModel.uid)
          .collection('events')
          .doc(eventModel.postId)
          .update({
        'attending': FieldValue.arrayRemove([currentUser!['uid']])
      });
    } else {
      await _firestore
          .collection('users')
          .doc(eventModel.uid)
          .collection('events')
          .doc(eventModel.postId)
          .update({
        'attending': FieldValue.arrayUnion([currentUser!['uid']])
      });
    }
  }
}
