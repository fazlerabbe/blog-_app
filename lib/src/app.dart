import 'package:blogapp/src/business_logic/view_models/post_details_viewmodel.dart';
import 'package:blogapp/src/business_logic/view_models/post_viewmodel.dart';
import 'package:blogapp/src/business_logic/view_models/profile_viewmodel.dart';
import 'package:blogapp/src/business_logic/view_models/signin_viewmodel.dart';
import 'package:blogapp/src/business_logic/view_models/write_post_viewmodel.dart';
import 'package:blogapp/src/views/ui/authenticate_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'business_logic/view_models/signup_viewmodel.dart';

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpViewModel>(create: (context)=> SignUpViewModel(),),
        ChangeNotifierProvider<SignInViewModel>(create: (context)=> SignInViewModel(),),
        ChangeNotifierProvider<ProfileViewModel>(create: (context)=> ProfileViewModel(),),
        ChangeNotifierProvider<WritePostViewModel>(create: (context)=> WritePostViewModel(),),
        ChangeNotifierProvider<PostDetailsViewModel>(create: (context)=> PostDetailsViewModel(),),
        FutureProvider(create: (_)=> PostViewModel().getCategories()),
      ],
      child: MaterialApp(
        title: 'Blog App',
        theme: ThemeData(
          fontFamily: 'BaiJamjuree'
        ),
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        home: AuthencatePage() ,
      ),
    );
  }
}
