// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharethechurch/utils/utils.dart';
import 'package:sharethechurch/views/post-auth/notifications/notifications_page.dart';
import 'package:sharethechurch/views/post-auth/chat/chat_page.dart';

import 'events/events_page.dart';
import 'home/home_page.dart';

class Church extends StatelessWidget {
  const Church({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize.set(MediaQuery.of(context).size.width);
    return HomeScaffoldWidget(
      child: GetBuilder<BottomIndexController>(
        init: BottomIndexController(),
        initState: (_) {},
        builder: (_) {
          return IndexedStack(
            index: _.index,
            children: widgets,
          );
        },
      ),
    );
  }
}

List<Widget> widgets = [
  const HomeView(),
  const EventsView(),
  const ChatView(),
  const NotificationsView(),
];
