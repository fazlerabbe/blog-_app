import 'package:flutter/cupertino.dart';

abstract class PostEvent {}

class GetAllPosts extends PostEvent {
  final String id;
  GetAllPosts({@required this.id});
}