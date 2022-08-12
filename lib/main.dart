import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'utils/utils.dart';
import 'views/export.dart';

bool? session;
int? userType;
Map? currentUser;






void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  session = await repository.checkSession();
  if (session != null) {
    userType = await repository.checkUserType();
    currentUser = await repository.getUserDetails();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'share the church',
      home: session != true
          ? const WelcomeView()
          : userType != 0
              ? const Church()
              : const Individual(),
    );
  }
}
