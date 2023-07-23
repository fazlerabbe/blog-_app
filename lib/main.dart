import 'package:blogapp/src/business_logic/blocs/add_new_post/add_new_post_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/add_new_post/add_new_post_states.dart';
import 'package:blogapp/src/business_logic/blocs/category/category_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/category/category_states.dart';
import 'package:blogapp/src/business_logic/blocs/login_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/login_states.dart';
import 'package:blogapp/src/business_logic/blocs/signup_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/app.dart';
import 'src/business_logic/blocs/posts/post_bloc.dart';
import 'src/business_logic/blocs/posts/post_states.dart';

main() {
  MultiBlocProvider blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(LoginInitialState()),
      ),
      BlocProvider<SignUpBloc>(
        create: (_) => SignUpBloc(SignUpInitialState()),
      ),
      BlocProvider<PostBloc>(
        create: (_) => PostBloc(PostsInitialState()),
      ),
      BlocProvider<CategoryBloc>(
        create: (_) => CategoryBloc(CategoryInitialState()),
      ),
      BlocProvider<AddNewPostBloc>(
        create: (_) => AddNewPostBloc(AddNewPostInitialState()),
      )
    ],
    child: BlogApp(),
  );
  runApp(blocProvider);
}