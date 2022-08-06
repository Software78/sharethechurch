import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharethechurch/main.dart';
import 'package:sharethechurch/models/chat_model.dart';
import 'package:sharethechurch/models/city_model.dart';
import 'package:sharethechurch/models/event_model.dart';
import 'package:sharethechurch/models/notifications_model.dart';
import 'package:sharethechurch/services/location/location.dart';
import 'package:sharethechurch/services/mail_service/mail_service.dart';
import 'package:sharethechurch/views/pre-auth/sign_up_view/church_sign_up/church_location_view/church_location_view.dart';

import '../models/user_model.dart';
import '../utils/utils.dart';
import '../views/export.dart';
import 'services.dart';

String? uid;

class Repository {
  final AuthService _authService = AuthService();
  final SessionManager _sessionManager = SessionManager();
  final CloudDatabaseService _cloudDatabaseService = CloudDatabaseService();
  final MailService _mailService = MailService();
  final LocationService _locationService = LocationService();

  //authentication
  registerUser(
      String email, String password, String username, bool isIndividual) async {
    List<String> keywords = [];

    if (!isIndividual) {
      for (var i = 1; i <= username.length; i++) {
        keywords.add(username.substring(0, i).toLowerCase());
      }
    }

    try {
      showLoadingDialog();
      UserCredential credential =
          await _authService.registerUser(email, password);
      uid = credential.user!.uid;
      UserModel user = UserModel(
        email: email,
        name: username,
        userTypeId: isIndividual ? 0 : 1,
        uid: credential.user!.uid,
        city: '',
        following: [],
        state: '',
        address: '',
        keywords: isIndividual ? null : keywords,
      );

      await _cloudDatabaseService.addUserToDb(user.uid, user.toJson());

      // await _mailService.sendWelcomeMail(email);
      closeRoute();
      navigateAndRemove(ChurchLocation(
        states: await getStates(),
      ));
    } on FirebaseAuthException catch (e) {
      closeRoute();
      showErrorSnackbar('${e.message}');
    }
  }

  /// 1.login
  /// 2. check user type from the backend
  /// 3. save the user type to memory for persistende
  /// 4. navigate to the respective screen
  /// 5. on error, show snackbar
  loginUser(String email, String password) async {
    try {
      showLoadingDialog();
      UserCredential credential = await _authService.loginUser(email, password);
      UserModel user =
          await _cloudDatabaseService.getUserInfo(credential.user!.uid);
      await _sessionManager.logInSuccessful(
        userTypeId: user.userTypeId,
        token: user.uid,
        email: user.email,
        city: user.city,
        state: user.state,
        address: user.address,
        name: user.name,
      );

      currentUser = await getUserDetails();
      closeRoute();
      navigateAndRemoveAll(
          user.userTypeId == 0 ? const Individual() : const Church());
    } on FirebaseAuthException catch (e) {
      closeRoute();
      showErrorSnackbar('${e.message}');
    }
  }

  /// 1. logout via firebase
  /// 2. clear session on storage
  /// 3. navigate to loginscreen
  logOutUser() async {
    try {
      showLoadingDialog();
      await _authService.logout();
      await _sessionManager.logOutSuccessful();
      closeRoute();
      navigateAndRemoveAll(const LoginView());
    } on FirebaseAuthException catch (e) {
      closeRoute();
      showErrorSnackbar('${e.message}');
    }
  }

  resetPassword(String email) async {
    try {
      showLoadingDialog();
      await _authService.forgotPassword(email);
      closeRoute();
      showMessageDialog('Email Sent');
    } on FirebaseAuthException catch (e) {
      closeRoute();
      showErrorSnackbar('${e.message}');
    }
  }

  //session management

  ///checks if user is previously signed in
  Future<bool?> checkSession() async {
    return await _sessionManager.checkSession();
  }

  ///checks if user is a church or an individual
  Future<int?> checkUserType() async {
    return await _sessionManager.checkUserType();
  }

  ///gets a user information from storage
  Future<Map<String, String?>> getUserDetails() async {
    return await _sessionManager.getUserDetails();
  }

  ///firestore methods
  Future<List<EventModel>> getEventList() async {
    List<EventModel> events = [];
    try {
      var snapshot = await _cloudDatabaseService.getEvents();
      for (var i = 0; i < snapshot.docs.length; i++) {
        events.add(EventModel.fromSnapshot(snapshot.docs[i]));
      }
    } catch (e) {
      showErrorSnackbar('An Error Occured');
      print(e);
    }
    return events;
  }

  Future<List<NotificationsModel>> getNotifications() async {
    List<NotificationsModel> notifications = [];
    try {
      var snapshot = await _cloudDatabaseService.getNotifications();
      for (var i = 0; i < snapshot.docs.length; i++) {
        notifications.add(NotificationsModel.fromSnapshot(snapshot.docs[i]));
      }
    } catch (e) {
      showErrorSnackbar('An Error Occured');
      print(e);
    }
    return notifications;
  }

  completeEvent(String postId) async {
    showLoadingDialog();
    await _cloudDatabaseService.markEventAsComplete(postId);
    closeRoute();
    showMessageDialog('Event Completed');
  }

  createEvent(
    String title,
    String description,
    String startDate,
    String startTime,
    String endDate,
    String endTime,
  ) async {
    await _cloudDatabaseService.addEvent(
      title: title,
      description: description,
      startDate: startDate,
      startTime: startTime,
      endDate: endDate,
      endTime: endTime,
    );
  }

  sendNotification(String title, String description) async {
    if (title != '' && description != '') {
      showLoadingDialog();
      await _cloudDatabaseService.sendNotification(
          title, description, currentUser!['name']);
      closeRoute();
      navigateRemoveAllGoHome();
    } else {
      showErrorSnackbar('field cannot be empty');
    }
  }

  Future<List<UserModel>> getRecipients() async {
    return await _cloudDatabaseService.getRecipients();
  }

  Future<List<ChatModel>> getChatList() async {
    List<ChatModel> chats = [];
    try {
      var snapshot = await _cloudDatabaseService.getChatList();

      for (var i = 0; i < snapshot.docs.length; i++) {
        chats.add(ChatModel.fromSnap(snapshot.docs[i]));
      }
    } catch (e) {
      showErrorSnackbar('An Error Occured');
      print(e);
    }
    return chats;
  }

  chatUser(String uid, String userName, String followerId,
      String followerName) async {
    showLoadingDialog();
    await _cloudDatabaseService.chatUser(
        uid, userName, followerId, followerName);
    closeRoute();
    navigateRemoveAllGoHome();
  }

  Stream getChats(String user) => _cloudDatabaseService.getChat(user);

  Stream searchChurch(String text) => _cloudDatabaseService.searchChurch(text);

  Stream searchAllChurches() => _cloudDatabaseService.searchAllChurches();

  sendMessage(String text, String user, String recipientId) =>
      _cloudDatabaseService.sendMessage(text, user, recipientId);

  Future<List?> getStates() async {
    return await _locationService.getStates();
  }

  Future<List<City>> getCities(String state) async {
    return await _locationService.getCities(state);
  }

  setCityAndState(
    String city,
    String state,
  ) async {
    return await _cloudDatabaseService.setCityAndState(city, state, uid);
  }

  followUser(String churchId) async {
    showLoadingDialog();
    await _cloudDatabaseService.followChurch(churchId);
    closeRoute();
  }

  attendEvent(EventModel eventModel) async {
    showLoadingDialog();
    await _cloudDatabaseService.attendEvent(eventModel);
    closeRoute();
  }
}
