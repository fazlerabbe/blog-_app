import 'dart:io';
import 'dart:ui';

import 'package:blogapp/src/business_logic/blocs/add_new_post/add_new_post_bloc.dart';
import 'package:blogapp/src/business_logic/blocs/add_new_post/add_new_post_events.dart';
import 'package:blogapp/src/business_logic/blocs/add_new_post/add_new_post_states.dart';
import 'package:blogapp/src/business_logic/view_models/write_post_viewmodel.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:blogapp/src/views/utils/reuseable_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class WritePost extends StatefulWidget {
  @override
  _WritePostState createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  File imageFile;
  TextEditingController _titleController, _urlController, _contentController;

  Future selectNewImage() async{
    try{
      imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {

      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _urlController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _urlController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var writeNewBlogViewModel = Provider.of<WritePostViewModel>(context);

    return ModalProgressHUD(
      inAsyncCall: writeNewBlogViewModel.inProgress,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HeaderWidget(
                  title: 'Write Post',
                ),
                SizedBox(
                  height: 10,
                ),
                SingleLineInputTextField(
                  obscureText: false,
                  labelText: 'Title',
                  hintText: 'title',
                  enable: true,
                  dark: false,
                  textEditingController: _titleController,
                ),
                SingleLineInputTextField(
                  obscureText: false,
                  labelText: 'Video URL(Optional)',
                  hintText: 'url',
                  enable: true,
                  dark: false,
                  textEditingController: _urlController,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          imageFile == null ? 'No Image Selected' : basename(imageFile.path.split("/").last)
                        ),
                      ),
                      OutlineButton(
                        child: Text('SELECT'),
                        onPressed: selectNewImage,
                        textColor: kDarkOrange,
                        borderSide: BorderSide(
                          color: kDarkOrange
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: kDarkOrange,
                    ),
                    child: TextField(
                      controller: _contentController,
                      selectionHeightStyle: BoxHeightStyle.max,
                      maxLines: 10000,
                      style: TextStyle(
                          color: kSoftBlack
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kSoftBlack),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'Write Post',
                        hintText: 'Write your post here',
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                            color: Colors.black38
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black54
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      ),
                    ),
                  ),
                ),
                BlocBuilder(
                  bloc: BlocProvider.of<AddNewPostBloc>(context),
                  builder: (context, state){
                    if (state is AddNewPostErrorState){
                      BotToast.showText(text: 'Something went wrong', textStyle: TextStyle(color: Colors.white), contentColor: Colors.red);
                    } else if (state is AddNewPostFailedState){
                      BotToast.showText(text: '${state.message}', textStyle: TextStyle(color: Colors.white), contentColor: Colors.red);
                    } else if (state is AddNewPostSuccessState){
                      BotToast.showText(text: 'Post added successfully!', textStyle: TextStyle(color: Colors.white), contentColor: Colors.green);
                    }
                    if ( state is AddNewPostLoadingState){
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                          child: CircularProgressIndicator()
                      );
                    } else {
                      return RoundedRaisedButton(
                        textColor: Colors.white,
                        text: 'POST',
                        onPress: () async {
                          if (_titleController.text
                              .trim()
                              .isNotEmpty) {
                            if (_contentController.text
                                .trim()
                                .isNotEmpty) {
                              BlocProvider.of<AddNewPostBloc>(context).add(
                                  AddNewPostAddBlogEvent(
                                      title: _titleController.text.trim(),
                                      content: _contentController.text.trim(),
                                      videoUrl: _urlController.text.trim(),
                                      image: imageFile));
                            } else {
                              BotToast.showText(
                                  text: 'Please enter title.',
                                  contentColor: Colors.red,
                                  textStyle: TextStyle(
                                      color: Colors.white
                                  )
                              );
                            }
                          } else {
                            BotToast.showText(
                                text: 'Please enter title.',
                                contentColor: Colors.red,
                                textStyle: TextStyle(
                                    color: Colors.white
                                )
                            );
                          }
                        },
                        color: kDarkOrange,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
