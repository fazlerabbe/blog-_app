import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:blogapp/src/services/web_services/blog_api_services.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';

class SignUpViewModel with ChangeNotifier{
  BlogApiServices _blogApiServices = BlogApiServices();
  bool inProgress = false;

  Future<bool> signUp(String name, String email, String password) async{
    inProgress = true;
    notifyListeners();
    var _response = await _blogApiServices.userSignUp(name, email, password);
    if (_response['error']){
      inProgress = false;
      notifyListeners();
      BotToast.showText(
          text: _response['status'],
          contentColor: kDarkOrange,
          textStyle: TextStyle(
              color: kSoftWhite
          )
      );
      return false;
    } else {
      inProgress = false;
      notifyListeners();
      SharedPrefServices.setInt('id', _response['id']);
      SharedPrefServices.setString('email', email);
      SharedPrefServices.setString('api_token', _response['api_token']);
      return true;
    }
  }
}