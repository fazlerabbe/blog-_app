import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HeaderWidget(
              title: 'Search',
            ),
            SingleLineInputTextField(
              dark: false,
              enable: true,
              hintText: 'Search',
              labelText: 'Search',
              obscureText: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 8, top: 8),
                  child: Column(
                    children: <Widget>[
                      PostTile(),
                      PostTile(),
                      PostTile(),
                      PostTile(),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
