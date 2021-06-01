// @dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:get/get.dart';
import 'package:utils_libs/utils_libs.dart';
import 'package:washing_machine/screens/screens.dart';
import 'package:washing_machine/storages/storages.dart';
import 'package:washing_machine/widgets/widgets.dart';
import 'api_resfull/api.dart';
import 'bloc/blocs.dart';
import 'bloc/simple_bloc_observer.dart';

Future main() async {
  Bloc.observer = SimpleBlocObserver();
  await DotEnv.load(fileName: BASE_URL.ENV);
  shareLocal = await ShareLocal.getInstance();

  WidgetsFlutterBinding.ensureInitialized();
  UserRepository userRepository = UserRepository();
  runApp(
      MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            userRepository: userRepository,
            localRepository: const EventRepositoryStorage(),
          )..add(AuthenticationStateInit()),
        ),
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: COLORS.PRIMARY_COLOR, // status bar color
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MESSAGES.APP_TITLE,
      initialRoute: ROUTE_NAMES.MAIN,
      getPages: [
        GetPage(
          name: ROUTE_NAMES.MAIN,
          page: () => MainScreen(),
        ),
        GetPage(
          name: ROUTE_NAMES.SCREEN_ONE,
          page: () => ScreenOne(),
        ),
        GetPage(
          name: ROUTE_NAMES.REGISTER,
          page: () => ScreenRegister(),
        ),
      ],
    );
  }
}
