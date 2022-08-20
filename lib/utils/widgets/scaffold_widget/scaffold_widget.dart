import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sharethechurch/utils/utils.dart';
import 'package:sharethechurch/views/post-auth/inner_routes/search/search.dart';

class HomeScaffoldWidget extends StatelessWidget {
  const HomeScaffoldWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

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
                        Image.asset(
                          'assets/images/dp.jpeg',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 20,
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
                                          navigate(userRoutes[0]);
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
];

List<String> churchStrings = [
  'Home',
  'Profile',
];

List<Widget> userRoutes = [
  const Search(),
];
