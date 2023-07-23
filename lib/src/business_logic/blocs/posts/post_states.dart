import 'package:blogapp/src/business_logic/models/blog.dart';
import 'package:flutter/cupertino.dart';

abstract class PostState {}

class PostsLoadingState extends PostState {}

class PostsErrorState extends PostState {}

class PostsFetchFailedState extends PostState {
  final String message;
  PostsFetchFailedState({@required this.message});
}

class PostsFetchedState extends PostState {
  final List<Blog> allPosts;
  PostsFetchedState({@required this.allPosts});
}

class PostsInitialState extends PostState {}

class PostsEmptyState extends PostState {}