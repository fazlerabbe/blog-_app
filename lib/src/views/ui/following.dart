import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Following extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HeaderWidget(
              title: 'Following',
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/bg.jpg'
                ),
              ),
              title: Text(
                'User name'
              ),
              subtitle: Text(
                '10 Posts'
              ),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.check
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/bg.jpg'
                ),
              ),
              title: Text(
                'User name'
              ),
              subtitle: Text(
                '10 Posts'
              ),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.check
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
