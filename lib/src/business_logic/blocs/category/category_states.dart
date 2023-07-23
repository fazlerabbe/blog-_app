import 'package:blogapp/src/business_logic/models/category_model.dart';
import 'package:flutter/material.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryFetchErrorState extends CategoryState {}

class CategoryFetchFailedState extends CategoryState {
  final String message;
  CategoryFetchFailedState({@required this.message});
}

class CategoryFetchedState extends CategoryState {
  final List<Category> categoryList;
  CategoryFetchedState({@required this.categoryList});
}

class CategoryEmptyState extends CategoryState {}