import 'package:blogapp/src/business_logic/blocs/login_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/login_event.dart';
import 'package:blogapp/src/business_logic/blocs/login_states.dart';
import 'package:blogapp/src/business_logic/view_models/signin_viewmodel.dart';
import 'package:blogapp/src/views/ui/home.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController, _passwordController;
  moveToHome(){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (BuildContext context) => Home()
    ));
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).listen((state) {
      if (state is LoginSuccessState){
        moveToHome();
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover)),
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
                          text: 'SIGN IN TO YOUR ACCOUNT',
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0.5,
                              wordSpacing: 0.5,
                              color: kSoftWhite)),
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
                          margin: EdgeInsets.only(left: 16, top: 40),
                          child: Image.asset(
                            'assets/images/quora.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 16, bottom: 8),
                        child: Text(
                          'WELCOME BACK',
                          style: TextStyle(
                              color: kSoftWhite,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 25, left: 16),
                        child: Text(
                          'TO BLOG APP',
                          style: TextStyle(
                              color: kSoftWhite,
                              letterSpacing: 0.5,
                              wordSpacing: 0.5),
                        ),
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
                      BlocBuilder(
                        bloc: BlocProvider.of<LoginBloc>(context),
                        builder: (context, state){
                          if (state is LoginErrorState){
                            BotToast.showText(
                                text: 'Something went wrong!',
                                contentColor: kDarkOrange,
                                textStyle: TextStyle(color: kSoftWhite));
                          } else if (state is LoginFailedState){
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
                              child: state is LoginLoadingState ? Container(
                                width : 25,
                                height: 25,
                                child:  CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                            ) : Text('Sign In', style: TextStyle(color: kSoftWhite, fontSize: 16, fontWeight: FontWeight.bold),),
                              color: kDarkOrange,
                              onPressed: () {
                                if (state is LoginLoadingState){

                                } else {
                                  bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(_emailController.text.trim());
                                  if (emailValid) {
                                    if (_passwordController.text.length >= 6) {
                                      BlocProvider.of<LoginBloc>(context).add(OnLoginEvent(email: _emailController.text.trim(), password: _passwordController.text));
                                    } else {
                                      BotToast.showText(
                                          text: 'Enter a valid password!',
                                          contentColor: kDarkOrange,
                                          textStyle: TextStyle(color: kSoftWhite));
                                    }
                                  } else {
                                    BotToast.showText(
                                        text: 'Please enter a valid email!',
                                        contentColor: kDarkOrange,
                                        textStyle: TextStyle(color: kSoftWhite));
                                  }
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
                            '<< SWIPE LEFT TO SIGN UP',
                            style: TextStyle(
                                color: kSoftWhite,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                wordSpacing: 0.5),
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
