import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';

class WidgetThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: threeItem.length,
        itemBuilder: (context, index) {
          return WidgetThreeItem(
            image: threeItem[index].image,
            title: threeItem[index].title,
            subTitle: threeItem[index].subTitle,
            price: threeItem[index].price,
          );
        },
      ),
    );
  }
}

