import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';

class WidgetOne extends StatelessWidget {
  final bool loading;

  const WidgetOne({Key? key, required this.loading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerLoading(
          isLoading: loading,
          child: WidgetRowList(
            isLoading: loading,
            image: ICONS.ICON,
            title: MESSAGES.ITEM1,
            subTitle: MESSAGES.DESCRIPTION,
          ),
        ),
        ShimmerLoading(
          isLoading: loading,
          child: WidgetRowList(
            isLoading: loading,
            image: ICONS.ICON,
            title: MESSAGES.ITEM2,
            subTitle: MESSAGES.DESCRIPTION,
          ),
        ),
        ShimmerLoading(
          isLoading: loading,
          child: WidgetRowList(
            isLoading: loading,
            image: ICONS.ICON,
            title: MESSAGES.ITEM3,
            subTitle: MESSAGES.DESCRIPTION,
          ),
        ),
      ],
    );
  }
}
