// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart' show AppStyle, AppValue, COLORS, ICONS, MESSAGES;
import 'package:flutter/material.dart';

class WidgetThreeItem extends StatelessWidget {
  final String? image, title, subTitle;
  final double? price;
  final Color? colorText, colorImage;
  final Function? onTap;
  final bool isLoading;

  WidgetThreeItem({this.title, this.subTitle, this.image, this.price, this.onTap, this.colorText = COLORS.WHITE, this.colorImage = COLORS.PRIMARY_COLOR, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: ()=> onTap!(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isLoading ? Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ) : Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: COLORS.WHITE,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                child: Container(
                  height: 55,
                  width: 55,
                  child: Image.asset(image!, color: colorImage,),
                ),
              ),
            ),
            AppValue.vSpaceTiny,
            isLoading ? Container(
              height: 15,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ) : Text(
                title!,
                style: AppStyle.DEFAULT_SMALLs.copyWith(color: colorText)
            ),
            AppValue.vSpaceTiny,
            isLoading ? Container(
              height: 15,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ) : Text(
                subTitle!,
                style: AppStyle.DEFAULT_SMALLs.copyWith(color: colorText)
            ),
            AppValue.vSpaceTiny,
            isLoading ? Container(
              height: 15,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ) : Text(
                price.toString() + MESSAGES.YEN_DISCOUNT,
                style: AppStyle.DEFAULT_SMALLs_BOLD.copyWith(color: colorText)
            ),
          ],
        ),
      ),
    );
  }
}

class ThreeItem {
  final String? image, title, subTitle;
  final double? price;
  final Function? onTap;
  ThreeItem({this.image, this.title, this.onTap, this.subTitle, this.price});
}

List<ThreeItem> threeItem = [
  ThreeItem(
    image: ICONS.ICON,
    title: MESSAGES.COUPON_NAME,
    subTitle: MESSAGES.COUPON_NAME,
    price: 19,
  ),
  ThreeItem(
    image: ICONS.ICON,
    title: MESSAGES.COUPON_NAME,
    subTitle: MESSAGES.COUPON_NAME,
    price: 200,
  ),
  ThreeItem(
    image: ICONS.ICON,
    title: MESSAGES.COUPON_NAME,
    subTitle: MESSAGES.COUPON_NAME,
    price: 9,
  ),
  ThreeItem(
    image: ICONS.ICON,
    title: MESSAGES.COUPON_NAME,
    subTitle: MESSAGES.COUPON_NAME,
    price: 19,
  ),
  ThreeItem(
    image: ICONS.ICON,
    title: MESSAGES.COUPON_NAME,
    subTitle: MESSAGES.COUPON_NAME,
    price: 200,
  ),
  ThreeItem(
    image: ICONS.ICON,
    title: MESSAGES.COUPON_NAME,
    subTitle: MESSAGES.COUPON_NAME,
    price: 9,
  ),
];