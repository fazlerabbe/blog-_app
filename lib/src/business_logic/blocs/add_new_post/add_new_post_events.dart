import 'dart:io';
import 'package:flutter/foundation.dart';

abstract class AddNewPostEvent {}

class AddNewPostAddBlogEvent extends AddNewPostEvent {
  final String title, videoUrl, content;
  final File image;
  AddNewPostAddBlogEvent({@required this.title, @required this.content, @required this.videoUrl, @required this.image});
}