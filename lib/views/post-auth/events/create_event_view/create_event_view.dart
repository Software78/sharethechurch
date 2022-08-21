import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/utils.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late TextEditingController _eventNameController, _descriptionController;

  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<DateTime?> getDate() async {
    var dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100, 1),
    );
    return dateTime;
  }

  bool startTimeBool = false;

  bool startDateBool = false;

  bool endTimeBool = false;
  bool endDateBool = false;
  Future<TimeOfDay?> getTime() async {
    var timeOfDay =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    return timeOfDay;
  }

  @override
  void initState() {
    _eventNameController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // addEvent() {
  //   showLoadingDialog();
  //   if (_descriptionController.text.isNotEmpty &&
  //       _eventNameController.text.isNotEmpty &&
  //       startTime != null &&
  //       startDate != null &&
  //       endDate != null &&
  //       endTime != null) {
  //     repository.createEvent(
  //       _eventNameController.text,
  //       _descriptionController.text,
  //       '${startDate!.year}/${startDate!.month}/${startDate!.day}',
  //       '${startTime!.hour} : ${startTime!.minute}',
  //       '${endDate!.year}/${endDate!.month}/${endDate!.day}',
  //       '${endTime!.hour} : ${endTime!.minute}',
  //     );
  //     closeRoute();
  //     navigateRemoveAllGoHome();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Incomplete Form'),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: true,
      text: 'Create Event',
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(
              text: 'Event Name',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          MultiLineTextField(
            controller: _eventNameController,
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(
              text: 'Brief description',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          MultiLineTextField(
            controller: _descriptionController,
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(
              text: 'Add a start an end date',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(
              text: 'Start :'.toUpperCase(),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: MyOutlinedButton(
                  text: startDate == null
                      ? 'Add Date'
                      : '${startDate!.year} : ${startDate!.month} : ${startDate!.day}',
                  onPressed: () async {
                    startDate = await getDate();
                    setState(() {
                      startDateBool = true;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: MyOutlinedButton(
                  text: startTime == null
                      ? 'Add Time'
                      : '${startTime!.hour} : ${startTime!.minute}',
                  onPressed: () async {
                    startTime = await getTime();
                    setState(() {
                      startTimeBool = true;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: MediumBodyText(
              text: 'End :'.toUpperCase(),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: MyOutlinedButton(
                  text: endDate == null
                      ? 'Add Date'
                      : '${endDate!.year} : ${endDate!.month} : ${endDate!.day}',
                  onPressed: () async {
                    endDate = await getDate();
                    setState(() {
                      endDateBool = true;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: MyOutlinedButton(
                  text: endTime == null
                      ? 'Add Time'
                      : '${endTime!.hour} : ${endTime!.minute}',
                  onPressed: () async {
                    endTime = await getTime();
                    setState(() {
                      endTimeBool = true;
                    });
                  },
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          const FilledButton(
            text: 'Add Event',
            onPressed: null,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
