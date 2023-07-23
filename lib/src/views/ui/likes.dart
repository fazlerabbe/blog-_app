import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Likes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HeaderWidget(
              title: 'Likes',
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.thumbsUp
              ),
              title: Text(
                'You have liked this post'
              ),
              subtitle: Text(
                '12.08AM . 12 March 2020'
              ),
            ),
            ListTile(
              leading: FaIcon(
                  FontAwesomeIcons.thumbsUp
              ),
              title: Text(
                  'You have liked this post'
              ),
              subtitle: Text(
                  '12.08AM . 12 March 2020'
              ),
            ),
            ListTile(
              leading: FaIcon(
                  FontAwesomeIcons.thumbsUp
              ),
              title: Text(
                  'You have liked this post'
              ),
              subtitle: Text(
                  '12.08AM . 12 March 2020'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
