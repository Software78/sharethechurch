import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart';
import 'package:sharethechurch/main.dart';
import 'package:sharethechurch/models/input/database_input.dart';
import 'package:sharethechurch/models/input/register_input.dart';
import 'package:sharethechurch/services/location/location.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import 'authentication/authentication.dart';
import 'firestore/firestore.dart';
import 'services.dart';

String? uid;

class Repository {
  final AuthService _authService = AuthService();
  final SessionManager _sessionManager = SessionManager();
  final CloudDatabaseService _cloudDatabaseService = CloudDatabaseService();
  final LocationService _service = LocationService();

  getLocationOnInit() async {
    LocationData? data = await _service.getLocation();
    await _service.getLocationName(data!);
  }

  Future<RegisterResponse> registerUser(RegisterInput input) async {
    try {
      await repository.getLocationOnInit();
      UserCredential credential =
          await _authService.registerUser(input.email, input.password);
      await _cloudDatabaseService.saveUserInfo(
        DatabaseInput(
          input: input,
          request: _service.request,
          credential: credential,
        ),
      );
      return RegisterResponse(status: true, credential: credential);
    } on FirebaseAuthException catch (e) {
      return RegisterResponse(status: false, message: e.message);
    }
  }

  Future<LoginResponse> loginUser(String email, String password) async {
    try {
      UserCredential credential = await _authService.loginUser(email, password);
      return LoginResponse(status: true, credential: credential);
    } on FirebaseAuthException catch (e) {
      return LoginResponse(
        status: false,
        message: e.message,
      );
    }

    // currentUser = await getUserDetails();
    // closeRoute();
    // navigateAndRemoveAll(
    //     user.userTypeId == 0 ? const Individual() : const Church());
  }

  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    try {
      await _authService.forgotPassword(email);
      return ForgotPasswordResponse(status: true);
    } on FirebaseAuthException catch (e) {
      return ForgotPasswordResponse(status: false, message: e.message);
    }
  }

  getUserFromDatabase(String uid) async {
    await _cloudDatabaseService.getUserInfo(uid);
  }

  Future<bool?> checkSession() async {
    return await _sessionManager.checkSession();
  }

  ///checks if user is a church or an individual
  Future<bool?> isIndividual() async {
    return await _sessionManager.checkUserType();
  }

  loginSucessful({required bool isIndividual}) async {
    await _sessionManager.setUserType(isIndividual);
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

  // createEvent(
  //   String title,
  //   String description,
  //   String startDate,
  //   String startTime,
  //   String endDate,
  //   String endTime,
  // ) async {
  //   await _cloudDatabaseService.addEvent(
  //     title: title,
  //     description: description,
  //     startDate: startDate,
  //     startTime: startTime,
  //     endDate: endDate,
  //     endTime: endTime,
  //   );
  // }

  // sendNotification(String title, String description) async {
  //   if (title != '' && description != '') {
  //     showLoadingDialog();
  //     await _cloudDatabaseService.sendNotification(
  //         title, description, currentUser!['name']);
  //     closeRoute();
  //     navigateRemoveAllGoHome();
  //   } else {
  //     showErrorSnackbar('field cannot be empty');
  //   }
  // }

  // Future<List<UserModel>> getRecipients() async {
  //   return await _cloudDatabaseService.getRecipients();
  // }

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

  // Future<List?> getStates() async {
  //   return await _locationService.getStates();
  // }

  // Future<List<City>> getCities(String state) async {
  //   return await _locationService.getCities(state);
  // }

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
