import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/keys/keys.dart';

class SessionManager {
  Future<SharedPreferences> _prefs() async {
    return await SharedPreferences.getInstance();
  }

  logInSuccessful({
    required int userTypeId,
    required String token,
    required String name,
    required String email,
    required String city,
    required String state,
    required String address,
  }) async {
    await _prefs().then((value) => value.setBool(KEY_LOGGED_IN, true));
    await _prefs().then((value) => value.setInt(KEY_USER_TYPE, userTypeId));
    await _prefs().then((value) => value.setString(KEY_USER_TOKEN, token));
    await _prefs().then((value) => value.setString(KEY_USER_NAME, name));
    await _prefs().then((value) => value.setString(KEY_USER_EMAIL, email));
    await _prefs().then((value) => value.setString(KEY_USER_CITY, city));
    await _prefs().then((value) => value.setString(KEY_USER_STATE, state));
    await _prefs().then((value) => value.setString(KEY_USER_ADDRESS, address));
  }

  logOutSuccessful() async {
    await _prefs().then((value) => value.setBool(KEY_LOGGED_IN, false));
    await _prefs().then((value) => value.remove(KEY_USER_TYPE));
    await _prefs().then((value) => value.remove(KEY_USER_TOKEN));
    await _prefs().then((value) => value.remove(KEY_USER_EMAIL));
    await _prefs().then((value) => value.remove(KEY_USER_NAME));
    await _prefs().then((value) => value.remove(KEY_USER_ADDRESS));
    await _prefs().then((value) => value.remove(KEY_USER_CITY));
    await _prefs().then((value) => value.remove(KEY_USER_STATE));
  }

  Future<bool?> checkSession() async {
    return await _prefs().then((value) => value.getBool(KEY_LOGGED_IN));
  }

  Future<int?> checkUserType() async {
    return await _prefs().then((value) => value.getInt(KEY_USER_TYPE));
  }

  newUser() async {
    await _prefs().then((value) => value.setBool(KEY_NEW_USER, true));
  }

  Future checkNewUser() async {
    return await _prefs().then((value) => value.getBool(KEY_NEW_USER));
  }

  Future<Map<String, String?>> getUserDetails() async {
    String? uid =
        await _prefs().then((value) => value.getString(KEY_USER_TOKEN));
    String? email =
        await _prefs().then((value) => value.getString(KEY_USER_EMAIL));
    String? name =
        await _prefs().then((value) => value.getString(KEY_USER_NAME));
    String? address =
        await _prefs().then((value) => value.getString(KEY_USER_ADDRESS));
    String? city =
        await _prefs().then((value) => value.getString(KEY_USER_CITY));
    String? state =
        await _prefs().then((value) => value.getString(KEY_USER_STATE));
    return {
      "name": name,
      "email": email,
      "address": address,
      "city": city,
      "state": state,
      "uid":uid,
    };
  }
}
