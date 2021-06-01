import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart';

class WidgetAreaSelect extends StatefulWidget {
  final List<String> item;
  final String? hintText;

  const WidgetAreaSelect({Key? key, required this.item, this.hintText}) : super(key: key);

  @override
  _WidgetAreaSelectState createState() => _WidgetAreaSelectState();
}

class _WidgetAreaSelectState extends State<WidgetAreaSelect> {

  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String item in widget.item) {
      items.add(DropdownMenuItem(value: item, child: Text(item, style: AppStyle.DEFAULT_MEDIUM,)));
    }
    return items;
  }
  var _value = '東京';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: COLORS.BLACK),
        borderRadius: BorderRadius.circular(3),
      ),
      width: AppValue.widths,
      child: DropdownButton(
        items: buildDropdownMenuItems(),
        icon: const Icon(Icons.keyboard_arrow_down),
        hint: Text(
            widget.hintText ?? MESSAGES.PLEASE_SELECT,
            style : AppStyle.DEFAULT_MEDIUM.copyWith(color: COLORS.TEXT_COLOR),
        ),
        onChanged: (String? value) {
          setState(() {
            _value = value!;
          });
        },
        isExpanded: true,
        underline: Container(),
        elevation: 2,
        style: AppStyle.DEFAULT_MEDIUM.copyWith(color: COLORS.TEXT_COLOR),
        isDense: false,
      ),
    );
  }
}

