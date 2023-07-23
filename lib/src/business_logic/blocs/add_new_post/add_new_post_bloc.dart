import 'package:blogapp/src/business_logic/blocs/add_new_post/add_new_post_events.dart';
import 'package:blogapp/src/business_logic/blocs/add_new_post/add_new_post_states.dart';
import 'package:blogapp/src/business_logic/blocs/posts/post_states.dart';
import 'package:blogapp/src/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewPostBloc extends Bloc<AddNewPostEvent, AddNewPostState> {
  final Repository _repository = Repository();
  AddNewPostBloc(AddNewPostState initialState) : super(initialState);

  @override
  Stream<AddNewPostState> mapEventToState(AddNewPostEvent event) async* {
    if (event is AddNewPostAddBlogEvent){
      yield AddNewPostLoadingState();
      try {
        var _response = await _repository.postNewBlog(title: event.title, content: event.content, videoUrl: event.videoUrl, image: event.image);
        if (_response['error']){
          yield AddNewPostFailedState(message: _response['status']);
        } else {
          yield AddNewPostSuccessState();
        }
      } catch (_) {
        yield AddNewPostErrorState();
      }
    }
  }

}