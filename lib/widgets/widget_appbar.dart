import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetAppbar extends StatelessWidget {
  final String title;
  final List<Widget>? left;
  final List<Widget>? right;
  final double height;
  final TextStyle? textStyleTitle;

  const WidgetAppbar({
    Key? key,
    required this.title,
    this.left,
    this.right,
    this.textStyleTitle,
    this.height = 36
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Stack(
        children: [
          left != null
              ? Positioned.fill(
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: left!,
                  ),
                )
              : AppValue.kEmptyWidget,
          right != null
              ? Positioned.fill(
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: right!,
                  ),
                )
              : AppValue.kEmptyWidget,
          Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: textStyleTitle ?? AppStyle.DEFAULT_MEDIUM.copyWith(
                            color: COLORS.WHITE,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
