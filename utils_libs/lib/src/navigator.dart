import 'package:get/get.dart';
import 'package:utils_libs/src/router.dart';
import 'package:utils_libs/utils_libs.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async => Get.back();

  static navigateSplash() async => await Get.toNamed(ROUTE_NAMES.SPLASH);

  static navigateLogin() async => await Get.toNamed(ROUTE_NAMES.LOGIN);

  static navigateLogout() async => await Get.offAllNamed(ROUTE_NAMES.LOGIN);

  static navigateMain() async => await Get.offAllNamed(ROUTE_NAMES.MAIN);

}
