import 'dart:convert';
import 'dart:io';
import 'package:blogapp/src/business_logic/utils/constants.dart';
import 'package:blogapp/src/services/shared_pref_services/shared_pref_services.dart';
import 'package:http/http.dart' as http;

const baseURL = "https://pirox-foodapi.000webhostapp.com/";
class BlogApiServices {
  http.Client client = http.Client();

  // get the base url response
  Future<dynamic> fetchBaseUrl() async{
    try{
      var response = await client.get(baseURL);
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // user sign up method
  Future<dynamic> userSignUp(String name, String email, String password) async{
    try{
      var response = await client.post(baseURL+'signUp', body: {
        'name': name,
        'email': email,
        'password': password
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // user sign in method
  Future<dynamic> userSignIn(String email, String password) async{
    try{
      var response = await client.post(baseURL+'signIn', body: {
        'email': email,
        'password': password
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // user sign in method
  Future<dynamic> getUserDetailsFromEmail(String email) async{
    try{
      var response = await client.post(baseURL+'getUserDetailsFromEmail', body: {
        'email': email,
        'api_token': Constants.api_token
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // get all category
  Future<dynamic> getCategories() async{
    try{
      var response = await client.post(baseURL+'categories', body: {
        'api_token': Constants.api_token
      });
      if (response.statusCode == 200){
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e){
      print(e.toString());
    }
  }

 // get all posts
  Future<dynamic> getPosts(String categoryId) async{
    try{
      var response = await client.post(baseURL+'getPosts', body: {
        'api_token': Constants.api_token,
        'type': categoryId
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e){
      print(e.toString());
    }
  }

  // add to favourites
  Future<dynamic> addToFavourites(String postId) async{
    try{
      var response = await client.post(baseURL+'addToFavourite', body: {
        'api_token': Constants.api_token,
        'post_id': postId,
        'user_id': Constants.id.toString()
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e){
      print(e.toString());
    }
  }

  // post a new blog
  Future<dynamic> postNewBlog({String title, File image, String videoUrl, String content}) async{
    try{
//      String base64Image = base64Encode(image.readAsBytesSync());
      //String imageName = Constants.id.toString() + DateTime.now().millisecondsSinceEpoch.toString()+''+ image.path.split("/").last;
      //print(imageName);
      var response = await client.post(baseURL+'postNewBlog', body: {
        'api_token': Constants.api_token,
        'user_id': Constants.id.toString(),
        'title': title,
        'url': videoUrl,
        'content': content,
        'category_id': "1",
//        'image': base64Image.toString(),
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // get al favourites blog
  Future<dynamic> getAllFavouritesBlog() async{
    try{

      var response = await client.post(baseURL+'getAllFavourites', body: {
        'api_token': Constants.api_token,
        'user_id': Constants.id.toString()
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

  // remove from favourite blog
  Future<dynamic> removeToFavourite(int id) async{
    try{
      var response = await client.post(baseURL+'removeFromFavourite', body: {
        'api_token': Constants.api_token,
        'id': id.toString()
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e){
      print(e.toString());
    }
  }

}