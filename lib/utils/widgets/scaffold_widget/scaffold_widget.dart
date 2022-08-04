import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sharethechurch/utils/utils.dart';
import 'package:sharethechurch/views/post-auth/chat/chat_list/chat_list.dart';
import 'package:sharethechurch/views/post-auth/inner_routes/contact.dart';
import 'package:sharethechurch/views/post-auth/inner_routes/profile.dart';
import 'package:sharethechurch/views/post-auth/inner_routes/search/search.dart';

import '../../../views/post-auth/events/create_event_view/create_event_view.dart';
import '../../../views/post-auth/notifications/send_notification/send_notification.dart';

class HomeScaffoldWidget extends StatelessWidget {
  const HomeScaffoldWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  Future<int?> checkSession() async {
    return await repository.checkUserType();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomIndexController>(
      init: BottomIndexController(),
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        drawer: _.index != 0
            ? null
            : Drawer(
                backgroundColor: primaryColor,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        const FlutterLogo(
                          size: 200,
                        ),
                        Expanded(
                          child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 20,
                                  ),
                              itemBuilder: (context, index) => ListTile(
                                    // tileColor: Colors.white,
                                    title: GestureDetector(
                                      onTap: () {
                                        if (index != 0) {
                                          //   _.updateDrawerIndex(index);
                                          closeRoute();
                                          navigate(userRoutes[index + -1]);
                                        } else {
                                          //    _.updateDrawerIndex(index);
                                          closeRoute();
                                        }
                                      },
                                      child: Text(
                                        userStrings[index],
                                        style: TextStyle(
                                            color: _._drawerIndex == index
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                              itemCount: userStrings.length),
                        ),
                        ReverseFilledButton(
                          text: 'Sign out',
                          onPressed: () {
                            repository.logOutUser();
                          },
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
        appBar: AppBar(
          title: LargeBodyText(text: titles[_.index]),
          iconTheme: const IconThemeData(color: primaryColor),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DeviceSize.deviceWidth * 0.05,
            ),
            child: child,
          ),
        ),
        floatingActionButton: _.index == 1 || _.index == 2 || _.index == 3
            ? FutureBuilder(
                future: checkSession(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == 0) {
                    if (_.index != 2) {
                      return const SizedBox();
                    }
                  }
                  return FloatingActionButton(
                    backgroundColor: primaryColor,
                    onPressed: () {
                      if (_.index == 1) {
                        navigate(const CreateEvent());
                      } else if (_.index == 2) {
                        navigate(const ChatList());
                      } else if (_.index == 3) {
                        navigate(const SendNotification());
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/svgs/${listOfIcons[_.index]}',
                      color: Colors.white,
                    ),
                  );
                })
            : null,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 68,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                listOfIcons.length,
                (index) => GestureDetector(
                  onTap: () {
                    _.updateIndex(index);
                  },
                  child: Container(
                    width: 80,
                    height: 48,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 11,
                    ),
                    decoration: BoxDecoration(
                      color: _.index == index ? primaryColor : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      'assets/svgs/${listOfIcons[index]}',
                      color: _.index == index ? Colors.white : primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> listOfIcons = [
  'navbar_icon_home.svg',
  'navbar_icon_event.svg',
  'navbar_icon_community.svg',
  'navbar_icon_notification.svg',
];

List<String> titles = [
  'Home',
  'Events',
  'Chat',
  'Notifications',
];

class ScaffoldWidget extends StatelessWidget {
  ScaffoldWidget({
    Key? key,
    required this.child,
    required this.hasAppBar,
    this.text = '',
  }) : super(key: key);

  final Widget child;
  final bool hasAppBar;
  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar
          ? AppBar(
              title: OrangeButtonText(text: text),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: primaryColor,
              ),
            )
          : null,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DeviceSize.deviceWidth * 0.05,
          ),
          child: child,
        ),
      ),
    );
  }
}

class BottomIndexController extends GetxController {
  int _index = 0;

  int _drawerIndex = 0;

  int get index => _index;

  updateIndex(int i) {
    _index = i;
    update();
  }

  updateDrawerIndex(int i) {
    _drawerIndex = i;
    update();
  }
}

List<String> userStrings = [
  'Home',
  'Search',
  'Profile',
  'Contact Us',
];

List<String> churchStrings = [
  'Home',
  'Profile',
  'Contact Us',
];

List<Widget> userRoutes = [
  const Search(),
  const Profile(),
  const ContactUs(),
];
