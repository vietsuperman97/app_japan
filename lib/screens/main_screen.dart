// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          color: COLORS.WHITE,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              WidgetButton(
                onTap: ()=> AppNavigator.navigateScreenOne(),
                text: 'SCREEN ONE',
              ),
              AppValue.vSpaceSmall,
              WidgetButton(
                onTap: ()=> AppNavigator.navigateScreenRegister(),
                text: 'REGISTER',
              ),
            ],
          ),
        ),
      ),
    );
  }

}