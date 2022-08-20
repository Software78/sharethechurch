import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sharethechurch/bloc/loginbloc/login_bloc.dart';
import 'package:sharethechurch/bloc/registerbloc/register_bloc.dart';
import 'package:sharethechurch/bloc/userbloc/user_bloc.dart';
import 'package:sharethechurch/screens/init/controller.dart';
import 'package:sharethechurch/services/location/location.dart';

import 'firebase_options.dart';

bool? session;
int? userType;
Map? currentUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  LocationService().getLocation();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
      ),
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
      BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return const InitScreen();
          }
          if (state is UserIsChurch) {
            return const Scaffold();
          }
          if (state is UserIsIndividual) {
            return const Scaffold();
          }
          return Container();
        },
      ),
    );
  }
}
