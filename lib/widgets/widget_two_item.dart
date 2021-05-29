// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart' show AppStyle, AppValue, COLORS, ICONS;
import 'package:flutter/material.dart';

class WidgetTowItem extends StatelessWidget {
  final String? image, title, content, time;
  final Color? colorText, colorIcon;
  final bool isLoading;

  WidgetTowItem({this.title, this.content, this.time, this.image, this.colorText = COLORS.WHITE,this.colorIcon = COLORS.PRIMARY_COLOR, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoading ? Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ) : Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: COLORS.WHITE,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Center(
            child: Container(
              height: 25,
              width: 25,
              child: Image.asset(image!, color: colorIcon,),
            ),
          ),
        ),
        AppValue.hSpaceSmall,
        Expanded(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: AppValue.widths-100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isLoading ? Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ) : Text(
                          title!,
                          style: AppStyle.DEFAULT_MEDIUM_BOLD.copyWith(color: colorText)
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: isLoading ? Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ) : Text(
                            time!,
                            style: AppStyle.DEFAULT_SMALLs.copyWith(color: colorText)
                        ),
                      ),
                    ],
                  ),
                ),
                AppValue.vSpaceTiny,
                isLoading ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    AppValue.vSpace(3),
                    Container(
                      height: 25,
                      width: AppValue.widths/2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )
                  ],
                ) : Container(
                  child: Text(
                      content!,
                      style: AppStyle.DEFAULT_SMALLs.copyWith(color: colorText),
                      textAlign: TextAlign.justify,
                  ),
                ),
                Divider(
                  color: COLORS.WHITE,
                  thickness: 1,
                  height: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
