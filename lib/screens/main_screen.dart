// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:washing_machine/widgets/widgets.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  bool _isLoading = true;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
    return Scaffold(
      body: Shimmer(
        linearGradient: _shimmerGradient,
        child: SafeArea(
          top: true,
          child: Container(
            color: COLORS.PRIMARY_COLOR,
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                WidgetOne(loading: _isLoading,),
                AppValue.vSpaceTiny,
                WidgetTwo(loading: _isLoading,),
                AppValue.vSpaceTiny,
                WidgetThree(loading: _isLoading,),
                AppValue.vSpaceTiny,
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