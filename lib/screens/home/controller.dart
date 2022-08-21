
import 'package:flutter/material.dart';

import 'view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeController();
}

class HomeController extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return HomeView(this);
  }
}
