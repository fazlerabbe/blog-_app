import 'package:flutter/foundation.dart';

abstract class AddNewPostState {}

class AddNewPostInitialState extends AddNewPostState {}

class AddNewPostLoadingState extends AddNewPostState {}

class AddNewPostErrorState extends AddNewPostState {}

class AddNewPostFailedState extends AddNewPostState {
  final String message;
  AddNewPostFailedState({@required this.message});
}

class AddNewPostSuccessState extends AddNewPostState {}