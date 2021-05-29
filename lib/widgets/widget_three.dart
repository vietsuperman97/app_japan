import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';

class WidgetThree extends StatelessWidget {
  final bool loading;

  const WidgetThree({Key? key, required this.loading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: loading ? const NeverScrollableScrollPhysics() : null,
        itemCount: threeItem.length,
        itemBuilder: (context, index) {
          return ShimmerLoading(
                    isLoading: loading,
                    child: WidgetThreeItem(
                      isLoading: loading,
                      image: threeItem[index].image,
                      title: threeItem[index].title,
                      subTitle: threeItem[index].subTitle,
                      price: threeItem[index].price,
              )
          );
        },
      ),
    );
  }
}

