import 'package:blogapp/src/business_logic/utils/constants.dart';
import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:blogapp/src/views/ui/signin.dart';
import 'package:blogapp/src/views/ui/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class AuthencatePage extends StatefulWidget {
  @override
  _AuthencatePageState createState() => _AuthencatePageState();
}

class _AuthencatePageState extends State<AuthencatePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    checkSignin();
  }

  checkSignin() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString('api_token') != null){
      Constants.email = prefs.getString('email');
      Constants.api_token = prefs.getString('api_token');
      Constants.id = prefs.getInt('id');
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) => Home()
      ));
    } else {
      print('Checked');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          SignIn(),
          SignUp(),
        ],
      ),
    );
  }
}
