import 'package:blogapp/src/business_logic/models/blog.dart';
import 'package:blogapp/src/business_logic/models/category_model.dart';
import 'package:blogapp/src/services/web_services/blog_api_services.dart';

class PostViewModel {
  BlogApiServices _blogApiServices = BlogApiServices();
  bool _inProgress = false;

  List<Category> _categories = List<Category>();
  List<Blog> _blogs = List<Blog>();

  bool get inProgress => this._inProgress;
  List<Category> get categories => this._categories;
  List<Blog> get blogs => this._blogs;

  Future<List<Category>> getCategories() async{
    _inProgress = true;
    _categories.clear();
    var jsonResponse = await _blogApiServices.getCategories();
    for (int i=0; i<jsonResponse.length; i++){
      _categories.add(Category.fromJson(jsonResponse[i]));
    }
    return _categories;
  }

  Future<List<Blog>> getPosts() async{
    _blogs.clear();
    var jsonResponse = await _blogApiServices.getPosts("1");
    for (int i=0; i<jsonResponse.length; i++){
      blogs.add(Blog.fromJson(jsonResponse[i]));
    }
    return _blogs;
  }
}