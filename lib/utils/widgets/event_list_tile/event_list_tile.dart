import 'package:flutter/material.dart';
import 'package:sharethechurch/models/events/event_model.dart';

import '../text_widgets/body_text.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallBodyText(
            text: '@ ${eventModel.church}',
            isTransparent: true,
          ),
          MediumBodyText(
            text: eventModel.title,
            fontSize: 16,
          ),
          SmallBodyText(text: eventModel.startDate),
        ],
      ),
    );
  }
}
