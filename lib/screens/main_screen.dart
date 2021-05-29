// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: COLORS.PRIMARY_COLOR,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SafeArea(
          top: true,
          child: Container(
            color: COLORS.PRIMARY_COLOR,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WidgetOne(),
                        AppValue.vSpaceTiny,
                        WidgetTwo(),
                        AppValue.vSpaceTiny,
                        WidgetThree(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}