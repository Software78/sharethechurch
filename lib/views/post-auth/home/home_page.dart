import 'package:flutter/material.dart';
import 'package:sharethechurch/models/events/event_model.dart';
import 'package:sharethechurch/utils/utils.dart';
import 'package:sharethechurch/utils/widgets/event_list_tile/event_list_tile.dart';

import '../../../utils/widgets/user_profile/user_profile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserProfileContainer(),
        const SizedBox(height: 10),
        Expanded(
          child: FutureBuilder<List<EventModel>>(
            future: repository.getEventList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<EventModel>> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => MyListTile(
                    eventModel: snapshot.data![index],
                  ),
                );
              }
              return const CircularProgressIndicator.adaptive();
            },
          ),
        )
      ],
    );
  }
}
