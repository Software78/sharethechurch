import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

class ChurchSearchItem extends StatelessWidget {
  const ChurchSearchItem({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final userModel;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: true,
      text: userModel['name'],
      child: Column(children: [
        const Expanded(child: SizedBox()),
        FilledButton(
          text: 'Follow ${userModel['name']}',
          onPressed: () {
            repository.followUser(userModel['uid']);
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
