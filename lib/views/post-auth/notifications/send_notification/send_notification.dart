import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

class SendNotification extends StatefulWidget {
  const SendNotification({Key? key}) : super(key: key);

  @override
  State<SendNotification> createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: true,
      text: 'Send Notification',
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(
              text: 'Enter notification title',
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InputField(
            controller: _titleController,
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(text: 'Enter notification title'),
          ),
          const SizedBox(
            height: 8,
          ),
          InputField(
            controller: _descriptionController,
            maxLines: 4,
          ),
          const Expanded(
            child: SizedBox(),
          ),
          FilledButton(
            text: 'Send',
            onPressed: () {
              repository.sendNotification(
                _titleController.text,
                _descriptionController.text,
              );
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
