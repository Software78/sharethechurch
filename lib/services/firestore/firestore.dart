import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharethechurch/main.dart';
import 'package:sharethechurch/models/events/notifications_model.dart';
import 'package:sharethechurch/models/input/database_input.dart';
import 'package:sharethechurch/models/input/user_model.dart';
import 'package:sharethechurch/utils/functions/dialog.dart';
import 'package:uuid/uuid.dart';

import '../../../models/events/event_model.dart';
import '../../models/chat/chat_model.dart';

class CloudDatabaseService {
  final String userCollectionPath = "users";

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  saveUserInfo(DatabaseInput input) async {
    await _firestore
        .collection(userCollectionPath)
        .doc(input.credential.user!.uid)
        .set(input.toJson(input));
  }

  Future<DocumentSnapshot> getUserInfo(String uid) async {
    return await _firestore.collection(userCollectionPath).doc(uid).get();
  }

 
  deleteEvent() {}

 
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
