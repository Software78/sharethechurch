import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name, uid, email, city, state, address;
  final int userTypeId;
  final List? keywords;
  final List following;
  UserModel({
    required this.name,
    required this.email,
    required this.uid,
    required this.city,
    required this.state,
    required this.address,
    required this.userTypeId,
    required this.following,
    required this.keywords,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
        "userTypeId": userTypeId,
        "city": city,
        "following": following,
        "state": state,
        "address": address,
        "keywords": keywords,
      };

 factory  UserModel.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        name: snapshot["name"],
        uid: snapshot["uid"],
        address: snapshot["address"],
        userTypeId: snapshot["userTypeId"],
        email: snapshot["email"],
        city: snapshot["city"],
        state: snapshot["state"],
        following: snapshot["following"],
        keywords: snapshot["keywords"]);
  }

 
}
