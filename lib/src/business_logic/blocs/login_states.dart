import 'package:flutter/foundation.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoggedInState extends LoginState {}

class LoginFailedState extends LoginState {
  final String message;
  LoginFailedState({@required this.message});
}

class LoginPasswordErrorState extends LoginState {}

class LoginEmailNotValidState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}