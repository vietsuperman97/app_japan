// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart' show AppStyle, AppValue, COLORS, ICONS;
import 'package:flutter/material.dart';

class WidgetRowList extends StatelessWidget {
  final String? image, title, subTitle;
  final Color? color;
  final bool isLoading;

  WidgetRowList({this.title, this.subTitle, this.image, required this.isLoading, this.color = COLORS.WHITE});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: AppValue.widths,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isLoading ? Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              ) : Container(
                height: 25,
                width: 25,
                child: Image.asset(image!, color: color,),
              ),
              AppValue.hSpaceSmall,
              Expanded(
                flex: 3,
                child: isLoading ? Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ) : Text(
                    title!,
                    style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: color)
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: isLoading ? Container(
                      height: 25,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ) : Text(
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
      )
    );
  }
}
