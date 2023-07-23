class User{
  String _userName, _imageUrl, _email;
  int _id;

  User.fromJson(var userJson){
    this._userName = userJson['name'];
    this._imageUrl = userJson['image'];
    this._email = userJson['email'];
    this._id = userJson['id'];
  }

  String get userName => this._userName;
  String get image => this._imageUrl;
  String get email => this._email;
  int get id => this._id;
}