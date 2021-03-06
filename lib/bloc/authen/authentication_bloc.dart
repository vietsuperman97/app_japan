// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv; // ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:washing_machine/api_resfull/api.dart';
import 'package:washing_machine/storages/storages.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required UserRepository userRepository,
      required EventRepositoryStorage localRepository})
      : _userRepository = userRepository,
        _localRepository = localRepository,
        super(const AuthenticationState.unknown()) {
    _authenticationStatusSubscription = _userRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }
  final EventRepositoryStorage _localRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;


  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStateInit) {
      yield* _mapAuthenticationStatusInit();
    } else if (event is AuthenticationStatusChanged) {
      yield* _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      AppNavigator.navigateLogout();
      await _localRepository.saveUser(DotEnv.env[PreferencesKey.TOKEN]!);
      await _localRepository.saveUserID("");
      _userRepository.logOut();
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _userRepository.dispose();
    return super.close();
  }

  Stream<AuthenticationState> _mapAuthenticationStatusInit() async*{
    await _localRepository.loadUser();
  }

  Stream<AuthenticationState> _mapAuthenticationStatusChangedToState(AuthenticationStatusChanged event) async* {
    try{
      final respose = await _localRepository.loadUser();
      if (respose != DotEnv.env[PreferencesKey.TOKEN]!) {
        _userRepository.addUser(User.fromJson(json.decode(respose)));
        yield AuthenticationState.authenticated();
      } else {
        _userRepository.addUser(User(token: DotEnv.env[PreferencesKey.TOKEN]!));
        yield AuthenticationState.unauthenticated();
      }
    }catch(e){
      throw e;
    }
  }
  static AuthenticationBloc of(BuildContext context) => BlocProvider.of<AuthenticationBloc>(context);
}
