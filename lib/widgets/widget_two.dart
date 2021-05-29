import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';

class WidgetTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetTowItem(
          image: ICONS.ICON,
          title: MESSAGES.TITLE,
          content: MESSAGES.TEXT,
          time: '8' + MESSAGES.MINUTE_AGO,
        ),
        WidgetTowItem(
          image: ICONS.ICON,
          title: MESSAGES.TITLE,
          content: MESSAGES.TEXT,
          time: '8' + MESSAGES.MINUTE_AGO,
        ),
      ],
    );
  }
}
