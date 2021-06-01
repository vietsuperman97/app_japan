// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart' show AppNavigator, ICONS;
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';

class WidgetBackButton extends StatelessWidget {
  final Function? onTap;
  final Color? color;
  final String? icon;
  final double? width, height;
  const WidgetBackButton({
    Key? key,
    this.onTap,
    this.color,
    this.icon,
    this.width = 40,
    this.height = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: width,
        width: height,
        decoration: BoxDecoration(shape: BoxShape.rectangle),
        child: WidgetAppbarMenu(
          isIcon: icon ?? ICONS.ICON_BACK,
          icon: Image.asset(icon ?? ICONS.ICON_BACK, fit: BoxFit.fill, color: color),
          onTap: onTap ?? () => AppNavigator.navigateBack(),
        )
    );
  }
}
