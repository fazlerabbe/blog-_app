
import 'package:blogapp/src/business_logic/blocs/category/category_states.dart';
import 'package:blogapp/src/business_logic/blocs/posts/post_events.dart';
import 'package:blogapp/src/business_logic/blocs/posts/post_states.dart';
import 'package:blogapp/src/business_logic/models/blog.dart';
import 'package:blogapp/src/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_states.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
  Repository _repository = Repository();
  List<Blog> allPostsList = List<Blog>();
  PostBloc(PostState initialState) : super(initialState);

  @override
  Stream<PostState> mapEventToState(PostEvent event) async*{
    if (event is GetAllPosts){
      try {
        yield PostsLoadingState();
        var allPosts = await _repository.getAllPosts(event.id);
        if (allPosts.length == 0){
          yield PostsEmptyState();
        } else {
          allPostsList.clear();
          allPosts.forEach((element) {
            allPostsList.add(Blog.fromJson(element));
          });
          yield PostsFetchedState(allPosts: allPostsList);
        }
      } catch (_){
        yield PostsErrorState();
      }
    }
  }
}