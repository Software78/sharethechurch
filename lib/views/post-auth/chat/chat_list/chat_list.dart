import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';
import 'package:sharethechurch/utils/widgets/recipients_list_tile/recipients_list_tile.dart';

import '../../../../models/user_model.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: true,
      text: 'Send a message',
      child: FutureBuilder<List<UserModel>>(
        future: repository.getRecipients(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.separated(
              itemBuilder: (context, index) =>
                  RecipientListTile(userModel: snapshot.data![index]),
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: snapshot.data!.length,
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
