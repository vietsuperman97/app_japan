// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/screens/screens.dart';
import 'package:washing_machine/widgets/widgets.dart';
class ScreenRegister extends StatefulWidget {
  @override
  _ScreenRegisterState createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          color: COLORS.WHITE,
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WidgetHeaderBar(
                  title: MESSAGES.MEMBER_REGISTER,
                  textStyleTitle: AppStyle.DEFAULT_LARGE_BOLD.copyWith(color: COLORS.BLACK, fontSize: 30),
                ),
                AppValue.vSpaceSmall,
                WidgetRegisterForm()
              ],
            ),
          ),
        ),
      ),
    );
  }

}