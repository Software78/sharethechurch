import 'package:cloud_firestore/cloud_firestore.dart';

class UserOutput {
  final String name;
  final String region;
  final String county;
  final String uid;
  final List<String>? keywords;
  final List<String>? followers;
  final List<String>? following;
  final String email;
  final bool isIndividual;

  UserOutput({
    required this.county,
    required this.email,
    this.followers,
    this.following,
    required this.isIndividual,
    this.keywords,
    required this.name,
    required this.region,
    required this.uid,
  });

  factory UserOutput.fromSnapshot(DocumentSnapshot snapshot) => UserOutput(
        county: snapshot["county"],
        email: snapshot["email"],
        isIndividual: snapshot["isIndividual"],
        name: snapshot["name"],
        region: snapshot["region"],
        uid: snapshot["uid"],
      );
}
