import 'dart:io';
import 'package:blogapp/src/services/web_services/blog_api_services.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class WritePostViewModel with ChangeNotifier{
  BlogApiServices _blogApiServices = BlogApiServices();
  bool _inProgress = false;
  File _image;
  String _status;

  String get status => this._status;
  File get image => this._image;
  bool get inProgress => this._inProgress;

  void clearImage(){
    this._image = null;
    notifyListeners();
  }

  Future<bool> postNewBlog(String title, String content, String videoUrl) async{
    _inProgress = true;
    notifyListeners();
    var _response = await _blogApiServices.postNewBlog(
      image: _image,
      content: content,
      videoUrl: videoUrl,
      title: title
    );
    print(_response);
    _status = _response['status'];
    _inProgress = false;
    notifyListeners();
    if (_response['error']){
      return false;
    } else {
      return true;
    }
  }

}