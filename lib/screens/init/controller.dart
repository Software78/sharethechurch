import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../bloc/bloc.dart';
import 'view.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => InitController();
}

class InitController extends State<InitScreen> {
  @override
  void initState() {
    context.read<UserBloc>().add(LoadUser());
    super.initState();
  }

  navigate(Widget widget) async {
    Future.delayed(const Duration(seconds: 2));
    Get.off(() => widget);
  }

  @override
  Widget build(BuildContext context) {
    return InitView(this);
  }
}
