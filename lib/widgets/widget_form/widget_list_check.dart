import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart';

class WidgetCheckGender extends StatefulWidget {
  @override
  _WidgetCheckGenderState createState() => _WidgetCheckGenderState();
}

class _WidgetCheckGenderState extends State<WidgetCheckGender> {
  late List<RadioButton> items = [
    RadioButton(
      title: MESSAGES.FEMALE,
      isCheckRender: false,
    ),
    RadioButton(
      title: MESSAGES.MALE,
      isCheckRender: false,
    ),
    RadioButton(
      title: MESSAGES.NOT_ANSWER,
      isCheckRender: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: AppValue.widths,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 3.0,
        ),
        padding: const EdgeInsets.all(4.0),
        itemCount: items.length,
        itemBuilder: (_, index) {
          List<RadioButton> list = [];
          return Button(
              onTap: () {
                for (var itemData in items) {
                  if (itemData.title == items[index].title) {
                    itemData = RadioButton(
                        title: itemData.title,
                        isCheckRender: !items[index].isCheckRender);
                    list.add(itemData);
                  } else {
                    itemData = RadioButton(
                        title: itemData.title, isCheckRender: false);
                    list.add(itemData);
                  }
                }
                setState(() => items = list);
              },
              child: WidgetItemCheck(
                title: items[index].title,
                isCheck: items[index].isCheckRender,
              )
          );
        },
      ),
    );
  }
}

class WidgetItemCheck extends StatelessWidget {
  final bool isCheck;
  final String title;

  const WidgetItemCheck({Key? key, required this.isCheck, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Row(
          children: [
            WidgetContainerImage(
              height: 20,
              width: 20,
              image: isCheck ? ICONS.ICON_CHECK : ICONS.ICON_NOT_CHECK,
            ),
            AppValue.hSpaceTiny,
            Text(
              title,
              style: isCheck
                  ? AppStyle.DEFAULT_SMALLs.copyWith(
                      color: COLORS.PRIMARY_COLOR)
                  : AppStyle.DEFAULT_SMALLs,
            )
          ],
        ),
      ),
    );
  }
}

class RadioButton {
  final String title;
  final bool isCheckRender;
  RadioButton({required this.title, required this.isCheckRender});
}
