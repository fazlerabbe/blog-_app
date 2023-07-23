import 'package:blogapp/src/business_logic/blocs/login_states.dart';
import 'package:blogapp/src/business_logic/blocs/signup_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/signup_event.dart';
import 'package:blogapp/src/business_logic/blocs/signup_states.dart';
import 'package:blogapp/src/business_logic/view_models/signup_viewmodel.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController, _passwordController, _confirmPasswordController, _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SignUpBloc>(context).listen((state) {
      if (state is SignUpSuccessState){
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) => Home()
        ));
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: MediaQuery.of(context).size.height,
                color: Colors.black87,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'SIGN UP FOR FREE NOW',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 0.5,
                          wordSpacing: 0.5,
                          color: kSoftWhite
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black87,
                  child: ListView(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 16,top: 40),
                          child: Image.asset(
                            'assets/images/quora.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 30,
                            left: 16,
                            bottom: 8
                        ),
                        child: Text(
                          'WELCOME',
                          style: TextStyle(
                            color: kSoftWhite,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 25,
                          left: 16
                        ),
                        child: Text(
                          'TO BLOG APP',
                          style: TextStyle(
                            color: kSoftWhite,
                            letterSpacing: 0.5,
                            wordSpacing: 0.5
                          ),
                        ),
                      ),
                      SingleLineInputTextField(
                        hintText: 'Full Name',
                        labelText: 'Full Name',
                        obscureText: false,
                        dark: true,
                        enable: true,
                        textEditingController: _nameController,
                      ),
                      SingleLineInputTextField(
                        hintText: 'Email',
                        labelText: 'Email',
                        obscureText: false,
                        dark: true,
                        enable: true,
                        textEditingController: _emailController,
                      ),
                      SingleLineInputTextField(
                        hintText: 'Password',
                        labelText: 'Password',
                        obscureText: true,
                        dark: true,
                        enable: true,
                        textEditingController: _passwordController,
                      ),
                      SingleLineInputTextField(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                        obscureText: true,
                        dark: true,
                        enable: true,
                        textEditingController: _confirmPasswordController,
                      ),
                      BlocBuilder(
                        bloc: BlocProvider.of<SignUpBloc>(context),
                        builder: (context, state){
                          if (state is SignUpErrorState){
                            BotToast.showText(
                                text: 'Something went wrong!',
                                contentColor: kDarkOrange,
                                textStyle: TextStyle(color: kSoftWhite));
                          } else if (state is SignUpFailedState){
                            BotToast.showText(
                                text: '${state.message}',
                                contentColor: kDarkOrange,
                                textStyle: TextStyle(color: kSoftWhite));
                          }
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              child:  state is SignUpLoadingState ? Container(
                                width : 25,
                                height: 25,
                                child:  CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                              ) : Text('Sign Up', style: TextStyle(
                                  color: kSoftWhite, fontSize: 16, fontWeight: FontWeight.bold
                              ),),
                              color: kDarkOrange,
                              textColor: kSoftWhite,
                              onPressed: () async{
                                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text.trim());
                                if (_nameController.text.trim().isNotEmpty){
                                  if (emailValid){
                                    if (_passwordController.text.length >= 6){
                                      if (_passwordController.text == _confirmPasswordController.text){
                                        print('Pressed!');
                                        BlocProvider.of<SignUpBloc>(context).add(OnSignUpEvent(
                                          name: _nameController.text.trim(),
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text
                                        ));
                                      } else {
                                        BotToast.showText(
                                            text: 'Both password does not match!',
                                            contentColor: kDarkOrange,
                                            textStyle: TextStyle(
                                                color: kSoftWhite
                                            )
                                        );
                                      }
                                    } else {
                                      BotToast.showText(
                                          text: 'Please enter a passwor more than 6 letters!',
                                          contentColor: kDarkOrange,
                                          textStyle: TextStyle(
                                              color: kSoftWhite
                                          )
                                      );
                                    }
                                  } else {
                                    BotToast.showText(
                                        text: 'Please enter a valid email!',
                                        contentColor: kDarkOrange,
                                        textStyle: TextStyle(
                                            color: kSoftWhite
                                        )
                                    );
                                  }
                                } else {
                                  BotToast.showText(
                                      text: 'Please enter your full name!',
                                      contentColor: kDarkOrange,
                                      textStyle: TextStyle(
                                          color: kSoftWhite
                                      )
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Text(
                            'SWIPE RIGHT TO SIGN IN >>',
                            style: TextStyle(
                              color: kSoftWhite,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              wordSpacing: 0.5
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}