import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sharethechurch/utils/utils.dart';
import 'package:sharethechurch/views/post-auth/events/events_page.dart';
import 'package:sharethechurch/views/post-auth/home/home_page.dart';

import 'notifications/notifications_page.dart';
import 'chat/chat_page.dart';

class Individual extends StatelessWidget {
  const Individual({Key? key}) : super(key: key);

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
            children: const [
              HomeView(),
              EventsView(),
              ChatView(),
              NotificationsView(),
            ],
          );
        },
      ),
    );
  }
}
