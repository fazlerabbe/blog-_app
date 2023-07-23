
import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:flutter/cupertino.dart';

class ProfileViewModel with ChangeNotifier {

  Future<bool> signOut() async{
    bool result = await SharedPrefServices.clearAll();
    return result;
  }
}