import 'package:blogapp/src/business_logic/view_models/profile_viewmodel.dart';
import 'package:blogapp/src/views/ui/authenticate_page.dart';
import 'package:blogapp/src/views/ui/change_name.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profileViewModel = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderWidget(
                  title: 'Profile',
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  child: Stack(children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/bg.jpg',
                      ),
                      radius: 70,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black45),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: kSoftWhite,
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text('User name'),
                  subtitle: Text('example@gmail.com'),
                  trailing: IconButton(
                    icon: Icon(Icons.mode_edit),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ChangeName()));
                    },
                  ),
                ),
                Card(
                    elevation: 2,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text('Following'),
                          trailing: Text(
                            '2323',
                            style: TextStyle(color: kDarkOrange),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        ListTile(
                          leading: Icon(Icons.beach_access),
                          title: Text('Followers'),
                          trailing: Text(
                            '234',
                            style: TextStyle(color: kDarkOrange),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ChangeName()));
                          },
                          leading: Icon(Icons.vpn_key),
                          title: Text('Change Password'),
                        ),
                        Divider(
                          height: 2,
                        ),
                        ListTile(
                            leading: Icon(Icons.lightbulb_outline),
                            title: Text('Dark Mode'),
                            trailing: Switch.adaptive(
                                value: false, onChanged: (value) {})),
                      ],
                    )),
                SizedBox(
                  height: 5,
                ),
                Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Logout'),
                      onTap: () async{
                        var result = await profileViewModel.signOut();
                        if (result){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (BuildContext context) => AuthencatePage()
                          ));
                        }
                      },
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
