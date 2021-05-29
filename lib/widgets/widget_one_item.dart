// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart' show AppStyle, AppValue, COLORS, ICONS;
import 'package:flutter/material.dart';

class WidgetRowList extends StatelessWidget {
  final String? image, title, subTitle;
  final Color? color;

  WidgetRowList({this.title, this.subTitle, this.image, this.color = COLORS.WHITE});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 25,
              width: 25,
              child: Image.asset(image!, color: color,),
            ),
            AppValue.hSpaceSmall,
            Expanded(
              flex: 3,
              child: Text(
                title!,
                style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: color)
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  subTitle!,
                  style: AppStyle.DEFAULT_SMALLs.copyWith(color: color))
                ),
              ),
          ],
        ),
        Divider(
          color: COLORS.WHITE,
          thickness: 1,
          height: 30,
        ),
      ],
    );
  }
}
