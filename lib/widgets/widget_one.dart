import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';

class WidgetOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetRowList(
          image: ICONS.ICON,
          title: MESSAGES.ITEM1,
          subTitle: MESSAGES.DESCRIPTION,
        ),
        WidgetRowList(
          image: ICONS.ICON,
          title: MESSAGES.ITEM2,
          subTitle: MESSAGES.DESCRIPTION,
        ),
        WidgetRowList(
          image: ICONS.ICON,
          title: MESSAGES.ITEM3,
          subTitle: MESSAGES.DESCRIPTION,
        ),
      ],
    );
  }
}
