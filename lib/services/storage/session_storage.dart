import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/keys/keys.dart';

class SessionManager {
  Future<SharedPreferences> _prefs() async {
    return await SharedPreferences.getInstance();
  }

  //sets login key to true
  logInSuccessful() async {
    await _prefs().then((value) => value.setBool(KEY_LOGGED_IN, true));
  }

  //sets login key to false
  logOutSuccessful() async {
    await _prefs().then((value) => value.setBool(KEY_LOGGED_IN, false));
    await _prefs().then((value) => value.clear());
  }

  //checks login key
  Future<bool?> checkSession() async {
    return await _prefs().then((value) => value.getBool(KEY_LOGGED_IN));
  }

  //gets user type from prefs
  Future<bool?> checkUserType() async {
    return await _prefs().then((value) => value.getBool(KEY_USER_TYPE));
  }

  //sets user type to pref
  setUserType(bool isIndividual) async {
    await _prefs().then((value) => value.setBool(KEY_USER_TYPE, isIndividual));
  }
}
