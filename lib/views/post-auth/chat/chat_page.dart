import 'package:flutter/material.dart';
import 'package:sharethechurch/models/chat/chat_model.dart';
import 'package:sharethechurch/utils/utils.dart';
import 'package:sharethechurch/views/post-auth/chat/chat_screen/chat_screen.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(
        //   height: 10,
        // ),
        const Divider(
          color: primaryColor,
        ),
        Expanded(
            child: FutureBuilder<List<ChatModel>>(
          future: repository.getChatList(),
          builder: (context, AsyncSnapshot<List<ChatModel>> snapshot) {
            if (snapshot.data != null) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: primaryColor,
                  height: 30,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () =>
                        navigate(ChatScreen(chatModel: snapshot.data![index])),
                    child: ChatListTile(model: snapshot.data![index])),
              );
            }
            return const CircularProgressIndicator.adaptive();
          },
        ))
      ],
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({Key? key, required this.model}) : super(key: key);

  final ChatModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            MediumBodyText(text: model.name, fontSize: 16),
            SmallBodyText(
              text: model.lastText,
              isPurple: true,
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        SmallBodyText(
          text: model.lastTextTime,
          isPurple: true,
        ),
      ],
    );
  }
}
