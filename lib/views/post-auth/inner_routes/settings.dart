import 'package:flutter/material.dart';
import 'package:sharethechurch/utils/widgets/scaffold_widget/scaffold_widget.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: true,
      text: 'Settings',
      child: Container(),
    );
  }
}
