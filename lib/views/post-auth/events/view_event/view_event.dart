import 'package:flutter/material.dart';
import 'package:sharethechurch/main.dart';
import 'package:sharethechurch/models/events/event_model.dart';
import 'package:sharethechurch/utils/utils.dart';

class ViewEvent extends StatelessWidget {
  const ViewEvent({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: true,
      text: eventModel.title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 104,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    'assets/images/dp.jpeg',
                    width: 88,
                    height: double.infinity,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: WhiteButtonText(
                          text: eventModel.church,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: WhiteButtonText(
                          text: eventModel.title,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MediumBodyText(
            text: 'Description',
          ),
          const SizedBox(
            height: 10,
          ),
          LargeBodyText(text: eventModel.description),
          const SizedBox(
            height: 10,
          ),
          MediumBodyText(
            text: 'Start',
          ),
          LargeBodyText(
              text: '${eventModel.startDate} at ${eventModel.startTime}'),
          const SizedBox(
            height: 10,
          ),
          MediumBodyText(
            text: 'End',
          ),
          LargeBodyText(text: '${eventModel.endDate} at ${eventModel.endTime}'),
          const SizedBox(
            height: 10,
          ),
          MediumBodyText(
            text: 'Status',
          ),
          LargeBodyText(
              text: eventModel.isDone == false ? 'Pending' : 'Completed'),
          const Expanded(child: SizedBox()),
          userType == 1
              ? MyOutlinedButton(
                  text: 'Mark Complete',
                  onPressed: () {
                    repository.completeEvent(eventModel.postId);
                  },
                )
              : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          FilledButton(
            text: userType == 1 ? 'Delete Event' : 'Attend',
            onPressed: () {
            
               repository.attendEvent(eventModel);
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
