import 'package:flutter/foundation.dart';

abstract class LoginEvent {}

class OnLoginEvent extends LoginEvent{
  final String email, password;
  OnLoginEvent({@required this.email,@required this.password});
}