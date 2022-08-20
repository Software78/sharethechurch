import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharethechurch/main.dart';
import 'package:sharethechurch/models/chat/chat_model.dart';
import 'package:sharethechurch/utils/utils.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  final ChatModel chatModel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ScrollController _scrollController;
  late TextEditingController _controller;
  @override
  void initState() {
    _scrollController = ScrollController();
    _controller = TextEditingController();
    super.initState();
  }

  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await repository.sendMessage(
        _controller.text,
        currentUser!['uid']!,
        widget.chatModel.user,
      );
      _controller.clear();
      // _scrollController.animateTo(
      //   _scrollController.position.maxScrollExtent,
      //   duration: const Duration(milliseconds: 1),
      //   curve: Curves.fastOutSlowIn,
      // );

    } else {
      Fluttertoast.showToast(msg: 'message can\'t be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: true,
      text: widget.chatModel.name,
      child: Column(
        children: [
          StreamBuilder(
              stream: repository.getChats(widget.chatModel.user),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator.adaptive();
                }
                List snap = snapshot.data.data()['Chats'] as List;

                return Expanded(
                  child: ListView.separated(
                    controller: _scrollController,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) => ChatTile(
                      chatItem: snap[index],
                    ),
                    itemCount: snap.length,
                  ),
                );
              }),
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
            ),
            padding: const EdgeInsets.only(left: 2),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 8),
                    width: double.infinity,
                    child: TextField(
                      cursorColor: primaryColor,
                      decoration: null,
                      autofocus: true,
                      controller: _controller,
                      textInputAction: TextInputAction.send,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: sendMessage,
                  child: Container(
                    width: DeviceSize.deviceWidth * 0.1,
                    height: 44,
                    color: primaryColor.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    child: SvgPicture.asset(
                      'assets/svgs/send.svg',
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.chatItem,
  }) : super(key: key);

  final String chatItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment:
              chatItem[0] == '0' ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 10,
            ),
            height: 36,
            // width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: primaryColor.withOpacity(0.1),
            ),
            child: MediumBodyText(
              text: chatItem.substring(1),
            ),
          ),
        )
      ],
    );
  }
}
