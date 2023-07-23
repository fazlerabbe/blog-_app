
import 'package:blogapp/src/business_logic/blocs/category/category_events.dart';
import 'package:blogapp/src/business_logic/blocs/category/category_states.dart';
import 'package:blogapp/src/business_logic/models/category_model.dart';
import 'package:blogapp/src/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState>{
  Repository _repository = Repository();
  List<Category> categoryList = List<Category>();
  CategoryBloc(CategoryState initialState) : super(initialState);

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is GetAllCategory){
      yield CategoryLoadingState();
      try {
        var _response = await _repository.getAllCategory();
        print(_response);
        if (_response.length == 0){
          yield CategoryEmptyState();
        } else {
          _response.forEach((element) {
            categoryList.add(Category.fromJson(element));
          });
          yield CategoryFetchedState(categoryList: categoryList);
        }
      } catch (_) {
        yield CategoryFetchErrorState();
      }
    }
  }

}