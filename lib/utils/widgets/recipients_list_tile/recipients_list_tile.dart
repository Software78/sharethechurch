import 'package:flutter/material.dart';
import 'package:sharethechurch/models/input/user_model.dart';

import '../../../main.dart';
import '../../utils.dart';

class RecipientListTile extends StatelessWidget {
  const RecipientListTile({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        repository.chatUser(
          currentUser!['uid'],
          currentUser!['name'],
          userModel.uid,
          userModel.name,
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2.0),
            child: Image.asset(
              'assets/images/dp.jpeg',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumBodyText(text: userModel.name, fontSize: 16),
              SmallBodyText(
                text: userModel.city,
                isPurple: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
