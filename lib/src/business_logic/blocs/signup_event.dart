import 'package:flutter/foundation.dart';

abstract class SignUpEvent {}

class OnSignUpEvent extends SignUpEvent{
  final String email, password, name;
  OnSignUpEvent({@required this.name,@required this.email,@required this.password});
}