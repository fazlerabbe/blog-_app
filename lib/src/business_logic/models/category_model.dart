class Category {
  int _id;
  String _name;

  Category.fromJson(var jsonCategory){
    this._id = jsonCategory['id'];
    this._name = jsonCategory['name'];
  }

  int get id => this._id;
  String get name => this._name;
}