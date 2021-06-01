import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart';

class WidgetButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final Color? backgroundColor, textColor;
  final double? height, width;
  final bool? enable;

  const WidgetButton({
    Key? key,
    required this.onTap,
    this.text,
    this.backgroundColor = COLORS.PRIMARY_COLOR,
    this.textColor = COLORS.WHITE,
    this.height = 50,
    this.width,
    this.enable = true,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: enable! ? backgroundColor : COLORS.GREY,
        ),
        child: Center(
            child: Text(
          text!,
          style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: COLORS.WHITE),
        )),
      ),
    );
  }
}
