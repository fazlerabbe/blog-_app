class Blog {
  int _id, _categoryId, _userId;
  String _images, _title, _content, _createdAt, _updatedAt;

  Blog.fromJson(var jsonBlog){
    this._id = jsonBlog['id'];
    this._userId = jsonBlog['user_id'];
    this._categoryId = jsonBlog['category_id'];
    this._images = jsonBlog['images'];
    this._content = jsonBlog['description'];
    this._title = jsonBlog['title'];
    this._createdAt = jsonBlog['created_at'];
    this._updatedAt = jsonBlog['updated_at'];
  }

  int get id => this._id;
  int get userId => this._userId;
  int get categoryId => this._categoryId;
  String get title => this._title;
  String get image => this._images;
  String get content => this._content;
  String get createdAt => this._createdAt;
  String get updatedAt => this._updatedAt;
}