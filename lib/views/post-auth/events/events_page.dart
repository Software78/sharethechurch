// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sharethechurch/models/events/event_model.dart';
import 'package:sharethechurch/utils/utils.dart';
import 'package:sharethechurch/views/post-auth/events/view_event/view_event.dart';

import '../../../utils/widgets/event_list_tile/event_list_tile.dart';

class EventsView extends StatelessWidget {
  const EventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: primaryColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: FutureBuilder<List<EventModel>>(
              future: repository.getEventList(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<EventModel>> snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        navigate(ViewEvent(eventModel: snapshot.data![index]));
                      },
                      child: MyListTile(
                        eventModel: snapshot.data![index],
                      ),
                    ),
                    itemCount: snapshot.data!.length,
                  );
                }
                return const CircularProgressIndicator.adaptive();
              }),
        )
      ],
    );
  }
}

List<Widget> noData = [
  const Expanded(child: SizedBox()),
  SvgPicture.asset(
    'assets/svgs/no_events.svg',
    color: primaryColor,
  ),
  const SizedBox(
    height: 24,
  ),
  LargeBodyText(
    text: 'Let\'s get started',
    fontSize: 18,
  ),
  const SizedBox(
    height: 8,
  ),
  MediumBodyText(
    text: 'Create an Event with the button below 👇',
    fontSize: 16,
  ),
  const Expanded(child: SizedBox()),
];
