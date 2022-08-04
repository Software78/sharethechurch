import 'package:flutter/material.dart';
import 'package:sharethechurch/models/notifications_model.dart';

import '../../utils.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final NotificationsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallBodyText(
            text: '@ ${model.church}',
            isTransparent: true,
          ),
          MediumBodyText(
            text: model.title,
            fontSize: 16,
          ),
          SmallBodyText(text: model.description)
        ],
      ),
    );
  }
}
