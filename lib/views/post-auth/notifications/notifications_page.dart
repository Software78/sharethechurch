import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

import '../../../models/events/notifications_model.dart';
import '../../../utils/widgets/notifications_list_tile/notifications_list_tile.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

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
          child: FutureBuilder<List<NotificationsModel>>(
            future: repository.getNotifications(),
            builder:
                (context, AsyncSnapshot<List<NotificationsModel>> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => NotificationListWidget(
                    model: snapshot.data![index],
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
