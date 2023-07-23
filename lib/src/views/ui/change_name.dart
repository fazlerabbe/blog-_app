import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class ChangeName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(
          color: kSoftWhite
        ),
        backgroundColor: kSoftBlack,
        title: Text(
          'Change Name'
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Align(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/bg.jpg',
                ),
                radius: 70,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SingleLineInputTextField(
              obscureText: false,
              labelText: 'email@example.com',
              hintText: 'email@example.com',
              dark: false,
              enable: false,
              textEditingController: null,
            ),
            SingleLineInputTextField(
              obscureText: false,
              labelText: 'User name',
              hintText: 'user name',
              dark: false,
              enable: true,
              textEditingController: null,
            ),
            RoundedRaisedButton(
              color: kDarkOrange,
              onPress: (){},
              text: 'SAVE',
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
