import 'package:flutter/foundation.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSignedState extends SignUpState {}

class SignUpFailedState extends SignUpState {
  final String message;
  SignUpFailedState({@required this.message});
}

class SignUpPasswordErrorState extends SignUpState {}

class SignUpEmailNotValidState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {}