import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharethechurch/models/input/register_input.dart';
import 'package:sharethechurch/models/models.dart';

class DatabaseInput {
  final RegisterInput input;
  final LocationRequest request;
  final UserCredential credential;

  DatabaseInput({
    required this.input,
    required this.request,
    required this.credential,
  });

  Map<String, dynamic> toJson(DatabaseInput input) {
    if (input.input.isIndividual) {
      return {
        "county": input.request.model!.county,
        "region": input.request.model!.region,
        "email": input.input.email,
        "name": input.input.username,
        "uid": input.credential.user!.uid,
        "isIndividual": input.input.isIndividual,
        "following": [],
      };
    } else {
      List<String> keywords = [];
      for (var i = 0; i < input.input.username.length; i++) {
        keywords.add(input.input.username.substring(0, i + 1));
      }
      return {
        "county": input.request.model!.county,
        "region": input.request.model!.region,
        "email": input.input.email,
        "name": input.input.username,
        "uid": input.credential.user!.uid,
        "isIndividual": input.input.isIndividual,
        "followers": [],
        "keywords": keywords,
      };
    }
  }
}
