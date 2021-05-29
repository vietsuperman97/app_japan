import 'package:utils_libs/utils_libs.dart'; // ignore: import_of_legacy_library_into_null_safe
import 'dart:io';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv; // ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart' show Dio; // ignore: import_of_legacy_library_into_null_safe
import 'package:washing_machine/api_resfull/api.dart';
enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class UserRepository {
  Dio dio = Dio();
  final _controller = StreamController<AuthenticationStatus>();
  final _controllerUser = StreamController<User>();
  UserRepository(){
    statusUser.listen((event) {
      if(event.token == DotEnv.env[PreferencesKey.TOKEN]!){
        dio = DioProvider.instance();
      }else{
        dio = DioProvider.instance(token: event.token);
      }
    });
  }

  //==========================================> GET <=========================================


  //=========================================> POST <=========================================


  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Stream<User> get statusUser async* {
    yield* _controllerUser.stream;
  }

  void logOut() => _controller.add(AuthenticationStatus.unauthenticated);

  void addUser(User user) => _controllerUser.add(user);

  void dispose(){
    _controllerUser.close();
    _controller.close();
  }
}