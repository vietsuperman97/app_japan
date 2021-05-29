import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';

class WidgetTwo extends StatelessWidget {
  final bool loading;

  const WidgetTwo({Key? key, required this.loading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerLoading(
          isLoading: loading,
          child: WidgetTowItem(
            isLoading: loading,
            image: ICONS.ICON,
            title: MESSAGES.TITLE,
            content: MESSAGES.TEXT,
            time: '8' + MESSAGES.MINUTE_AGO,
          ),
        ),
        ShimmerLoading(
          isLoading: loading,
          child: WidgetTowItem(
            isLoading: loading,
            image: ICONS.ICON,
            title: MESSAGES.TITLE,
            content: MESSAGES.TEXT,
            time: '8' + MESSAGES.MINUTE_AGO,
          )
        ),
      ],
    );
  }
}
