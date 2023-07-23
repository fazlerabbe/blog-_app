import 'package:blogapp/src/business_logic/models/favourite_model.dart';
import 'package:blogapp/src/business_logic/view_models/favourites_viewmodel.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicator_button/progress_button.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Favourite> favouriteList;
  FavouriteViewModel _favouriteViewModel;

  @override
  void initState() {
    super.initState();
    favouriteList = List();
    _favouriteViewModel = FavouriteViewModel();
    //getFavourites();
  }

  getFavourites()async{
    await _favouriteViewModel.getAllFavourites();
    setState(() {
      favouriteList = _favouriteViewModel.favourites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HeaderWidget(
              title: 'Favourites',
            ),
            Expanded(
              child: FutureBuilder(
                future: _favouriteViewModel.getAllFavourites(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.active:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.done:
                      if (_favouriteViewModel.favourites.length != 0){
                        return ListView.builder(
                            itemCount: _favouriteViewModel.favourites.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                      'assets/images/bg.jpg'
                                  ),
                                ),
                                title: Text(
                                    '${_favouriteViewModel.favourites[index].blog.title}'
                                ),
                                subtitle: Text(
                                  '${_favouriteViewModel.favourites[index].blog.content}',
                                  maxLines: 2,
                                ),
                                trailing: IconButton(
                                  onPressed: () async{
                                    var response = await _favouriteViewModel.removeToFavourites(_favouriteViewModel.favourites[index].id);
                                    if (response){
                                      _favouriteViewModel.favourites.clear();
                                      setState(() {

                                      });
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                _favouriteViewModel.status,
                                                style: TextStyle(
                                                    color: Colors.white
                                                ),
                                              ),
                                              backgroundColor: Colors.green
                                          )
                                      );
                                    } else {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                _favouriteViewModel.status,
                                                style: TextStyle(
                                                    color: Colors.white
                                                ),
                                              ),
                                              backgroundColor: Colors.red
                                          )
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    Icons.delete_outline
                                  ),
                                )
                              );
                            });
                      } else {
                        print(_favouriteViewModel.favourites.length);
                        return Center(
                          child: Text(
                            'Favourites is empty!'
                          ),
                        );
                      }
                      break;
                  }
                  return null;
                },
              )
            )
          ],
        ),
      ),
    );
  }
}

//favouriteList.length == 0 ? Center(
//child: CircularProgressIndicator(),
//) :
//ListView.builder(
//itemCount: favouriteList.length,
//itemBuilder: (context, index){
//return ListTile(
//leading: ClipRRect(
//borderRadius: BorderRadius.circular(5),
//child: Image.asset(
//'assets/images/bg.jpg'
//),
//),
//title: Text(
//'${favouriteList[index].blog.title}'
//),
//subtitle: Text(
//'${favouriteList[index].blog.content}',
//maxLines: 2,
//),
//trailing: InkWell(
//onTap: (){},
//child: Icon(
//Icons.delete_outline,
//color: kDarkOrange,
//),
//),
//);
//}),