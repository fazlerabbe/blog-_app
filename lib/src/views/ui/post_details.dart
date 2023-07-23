import 'package:blogapp/src/business_logic/models/blog.dart';
import 'package:blogapp/src/business_logic/view_models/post_details_viewmodel.dart';
import 'package:blogapp/src/views/utils/contraints.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostDetails extends StatefulWidget {
  PostDetails({@required this.blog});

  final Blog blog;

  @override
  _PostDetailsState createState() => _PostDetailsState(
    blog: blog
  );
}

class _PostDetailsState extends State<PostDetails> {
  _PostDetailsState({@required this.blog});
  final Blog blog;
  var dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.parse(blog.createdAt);
  }

  @override
  Widget build(BuildContext context) {
    var postDetailsViewModel = Provider.of<PostDetailsViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/images/bg.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, color: kDarkOrange, size: 30,),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${widget.blog.title}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${DateFormat('EEEE, H:MM, d MMM, yyyy').format(dateTime)}',
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.play_circle_filled,
                        color: kDarkOrange,
                      ),
                      title: Text(
                        'Play Video'
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${widget.blog.content}',
                      softWrap: true,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.3,
                        wordSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.favorite,
                          color: kDarkOrange,
                          ),
                          onPressed: () async{
                            var result = await postDetailsViewModel.addToFavourite(blog.id);
                            if (result){
                              BotToast.showText(
                                text: postDetailsViewModel.status,
                                textStyle: TextStyle(
                                  color: Colors.white
                                ),
                                contentColor: Colors.green
                              );
                            } else {
                              BotToast.showText(
                                  text: postDetailsViewModel.status,
                                  textStyle: TextStyle(
                                      color: Colors.white
                                  ),
                                  contentColor: Colors.red
                              );
                            }
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '12004'
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.thumb_up,
                          color: kSoftWhite,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                            '12004'
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/quora.png'),
                      ),
                      title: Text('Username'),
                      subtitle: Text('Following', style: TextStyle(color: kDarkOrange),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
