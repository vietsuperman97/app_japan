// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart';
import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:washing_machine/api_resfull/api.dart';
import 'package:washing_machine/storages/storages.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final EventRepositoryStorage localRepository;

  LoginBloc({required this.userRepository, required this.localRepository})
      : super(const LoginState());

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      final email = UserName.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : UserName.pure(event.email),
        status: Formz.validate([email, state.password]),
      );
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.email, password]),
      );
    } else if (event is EmailUnfocused) {
      final email = UserName.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      );
    } else if (event is PasswordUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      );
    } else if (event is FormSubmitted) {
      try{
        if (state.status.isValidated) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          // var response = await userRepository.loginApp(
          //     username: state.email.value, password: state.password.value);
          // if (response.status == BASE_URL.SUCCESS) {
          //   await localRepository.saveUser(jsonEncode(response));
          //   yield state.copyWith(status: FormzStatus.submissionSuccess, message: response.message);
          // } else {
          //   yield state.copyWith(status: FormzStatus.submissionFailure, message: response.message);
          // }
        }
      }catch(e){
        throw e;
      }
    }
  }
  static LoginBloc of(BuildContext context) => BlocProvider.of<LoginBloc>(context);
}
