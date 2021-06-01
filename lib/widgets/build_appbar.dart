// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart' show COLORS;
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';

class WidgetHeaderBar extends StatelessWidget {
  final String title;
  final String? icon;
  final List<Widget>? right;
  final GlobalKey<ScaffoldState>? drawerKey;
  final TextStyle? textStyleTitle;

  WidgetHeaderBar({required this.title, this.icon, this.right, this.drawerKey, this.textStyleTitle});

  @override
  Widget build(BuildContext context) {
    return WidgetAppbar(
      textStyleTitle: textStyleTitle,
      left: [
        WidgetBackButton(
          height: 12,
          width: 18,
          icon: icon,
          onTap: drawerKey != null
              ? () => drawerKey!.currentState!.openDrawer()
              : null,
        ),
      ],
      right: right,
      title: title,
    );
  }
}
