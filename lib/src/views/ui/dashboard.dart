import 'package:blogapp/src/business_logic/blocs/category/category_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/category/category_events.dart';
import 'package:blogapp/src/business_logic/blocs/category/category_states.dart';
import 'package:blogapp/src/business_logic/models/category_model.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../business_logic/blocs/posts/post_bloc.dart';
import '../../business_logic/blocs/posts/post_events.dart';
import '../../business_logic/blocs/posts/post_states.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostBloc>(context).add(GetAllPosts(id: '1'));
    BlocProvider.of<CategoryBloc>(context).add(GetAllCategory());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: BlocBuilder(
                bloc: BlocProvider.of<CategoryBloc>(context),
                builder: (context, state){
                  print('Called');
                  if (state is CategoryLoadingState){
                    return LinearProgressIndicator();
                  } else if (state is CategoryEmptyState){
                    return Center(child: Text('Empty category!'),);
                  } else if (state is CategoryFetchFailedState){
                    return Center(child: Text('${state.message}'),);
                  } else if (state is CategoryFetchErrorState){
                    return Center(child: Text('Something went wrong!'),);
                  } else if (state is CategoryFetchedState){
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categoryList.length,
                        itemBuilder: (context, index){
                          return Row(
                            children: <Widget>[
                              Chip(
                                label: Text(state.categoryList[index].name),
                                elevation: 2,
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          );
                        });
                  }
                  return Container();
                },
              )
            ),
            HeaderWidget(
              title: 'Recent',
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8),
                child: BlocBuilder(
                  bloc: BlocProvider.of<PostBloc>(context),
                  builder: (context, state){
                    if (state is PostsLoadingState){
                      return Center(child: CircularProgressIndicator());
                    } else if (state is PostsEmptyState){
                      return Center(
                        child: Text(
                            'There is no post yet!'
                        ),
                      );
                    } else if (state is PostsFetchedState){
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.allPosts.length,
                          itemBuilder: (context, index){
                            return PostTile(
                              blog: state.allPosts[index],
                            );
                          });
                    } else if (state is PostsErrorState){
                      return Center(
                        child: Text(
                            'Something went wrong!'
                        ),
                      );
                    } else if (state is PostsFetchFailedState){
                      return Center(
                        child: Text(
                            'Failed to fetch posts!'
                        ),
                      );
                    } else if (state is PostsInitialState){
                      Center(child: CircularProgressIndicator());
                    }
                    return Container();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
