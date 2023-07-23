import 'package:blogapp/src/services/web_services/blog_api_services.dart';
import 'package:flutter/cupertino.dart';

class PostDetailsViewModel with ChangeNotifier{
  BlogApiServices _blogApiServices = BlogApiServices();
  bool _favouriteInProgress = false;
  String _status;

  bool get favouriteInProgress => this._favouriteInProgress;
  String get status => this._status;

  Future<bool> addToFavourite(int id) async{
    _favouriteInProgress = true;
    notifyListeners();
    var _response = await _blogApiServices.addToFavourites(id.toString());
    print(_response);
    if (_response['error']){
      _status = _response['status'];
      _favouriteInProgress = false;
      notifyListeners();
      return false;
    } else {
      _status = _response['status'];
      _favouriteInProgress = false;
      notifyListeners();
      return true;
    }
  }
}