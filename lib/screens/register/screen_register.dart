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

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
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

const _shimmerGradient = LinearGradient(
  colors: [
    COLORS.GREY_300,
    COLORS.GREY_400,
    COLORS.GREY_300,
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);