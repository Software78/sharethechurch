import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sharethechurch/utils/utils.dart';

class CustomTabber extends StatelessWidget {
  const CustomTabber({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomTabberIndexController>(
      init: CustomTabberIndexController(),
      builder: (_) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: _.index == 0
                  ? Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: OrangeButtonText(
                          text: tabs[0],
                          // fontSize: 14,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        _.updateIndex(0);
                      },
                      child: Center(
                        child: WhiteButtonText(
                          text: tabs[0],
                        ),
                      )),
            ),
            Expanded(
              child: _.index == 0
                  ? GestureDetector(
                      onTap: () {
                        _.updateIndex(1);
                        //  _.index = 1;
                      },
                      child: Center(
                        child: WhiteButtonText(
                          text: tabs[1],
                        ),
                      ),
                    )
                  : Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: OrangeButtonText(
                          text: tabs[1],
                          // fontSize: 14,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabberIndexController extends GetxController {
  int index = 0;

  updateIndex(int index) {
    this.index = index;
    update();
  }
}
