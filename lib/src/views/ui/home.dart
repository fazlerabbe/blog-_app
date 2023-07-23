import 'package:blogapp/src/views/ui/dashboard.dart';
import 'package:blogapp/src/views/ui/following.dart';
import 'package:blogapp/src/views/ui/likes.dart';
import 'package:blogapp/src/views/ui/profile.dart';
import 'package:blogapp/src/views/ui/search.dart';
import 'package:blogapp/src/views/ui/write_post.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'favourites.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum Buttons{
  dashboard,
  write,
  search,
  favourites,
  following,
  likes,
  profiles
}

class _HomeState extends State<Home> {
  int index = 0;
  int _selectedIndex = 0;

  changeIndex(int i){
    setState(() {
      index = i;
    });
  }
  final List<Widget> screens = [
    Dashboard(),
    WritePost(),
    Search(),
    Favourites(),
    Following(),
    Likes(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              child: NavigationRail(
                selectedIconTheme: IconThemeData(
                  color: kDarkOrange,
                  size: 30
                ),
                selectedLabelTextStyle: TextStyle(
                  color: kDarkOrange,
                  fontSize: 0
                ),
                unselectedIconTheme: IconThemeData(
                  color: kSoftWhite,
                ),
                backgroundColor: kSoftBlack,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.none,
                elevation: 3,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard),
                    label: Text('Dashboard'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.edit),
                    label: Text('Write Post'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search),
                    label: Text('Search'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite_border),
                    label: Text('Favourites'),
                  ),
                  NavigationRailDestination(
                    icon: FaIcon(
                      FontAwesomeIcons.users
                    ),
                    label: Text('Following'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.thumb_up),
                    label: Text('Likes'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: screens[_selectedIndex]
            )
          ],
        ),
      ),
    );
  }
}
