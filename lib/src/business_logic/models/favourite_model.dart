import 'package:blogapp/src/business_logic/models/blog.dart';

class Favourite{
  int _id, _postId;
  Blog _blog;

  Favourite.fromJson(var jsonFavourite){
    this._id = jsonFavourite['id'];
    this._postId = jsonFavourite['post_id'];
    this._blog = Blog.fromJson(jsonFavourite['blog']);
  }
  int get id => this._id;
  int get postID => this._postId;
  Blog get blog => this._blog;
}