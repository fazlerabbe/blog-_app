import 'package:blogapp/src/business_logic/models/blog.dart';
import 'package:blogapp/src/views/ui/post_details.dart';
import 'package:flutter/material.dart';
import 'contraints.dart';

class SingleLineInputTextField extends StatelessWidget {
  SingleLineInputTextField({
    @required this.hintText,
    @required this.labelText,
    @required this.obscureText,
    @required this.dark,
    @required this.enable,
    @required this.textEditingController
  });

  final String hintText, labelText;
  final bool obscureText;
  final bool dark;
  final bool enable;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Theme(
        data: ThemeData(
          primaryColor: kDarkOrange,
        ),
        child: TextField(
          enabled: enable,
          obscureText: obscureText,
          controller: textEditingController,
          style: TextStyle(
              color: dark ? kSoftWhite : kSoftBlack
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: dark ? kSoftWhite : kSoftBlack),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            labelText: '$labelText',
            hintText: '$hintText',
            hintStyle: TextStyle(
                color: dark ? Colors.white12 : Colors.black38
            ),
            labelStyle: TextStyle(
                color: dark ? Colors.white24 : Colors.black54
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
        ),
      ),
    );
  }
}

class RoundedRaisedButton extends StatelessWidget {
  RoundedRaisedButton({@required this.text, @required this.color, @required this.textColor, @required this.onPress});

  final String text;
  final Color color, textColor;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        textColor: textColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        onPressed: onPress,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '$text',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: 15
            ),
          ),
        ),
      ),
    );
  }
}

class PostTile extends StatelessWidget {
  PostTile({@required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    print(blog.content);
    return InkWell(
      onTap: (){
        print('Tap');
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context)=> PostDetails(blog: blog,)
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/bg.jpg',
            width: MediaQuery.of(context).size.width,
            height: 180,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${blog.title}',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${blog.content}',
            softWrap: true,
            maxLines: 4,
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 0.3,
              wordSpacing: 0.3,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  child: Text(
                    'Read More',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: kDarkOrange
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                    color: Colors.black38,
                    thickness: 1
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class FavouriteTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('Tap');
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context)=> PostDetails()
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/bg.jpg',
            width: MediaQuery.of(context).size.width,
            height: 180,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Title will be here',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Its ancestors must include Material, MediaQuery, Directionality, and MaterialLocalizations. Typically all of these widgets are provided by MaterialApp and Scaffold. The label and clipBehavior arguments must not be null.',
            softWrap: true,
            maxLines: 4,
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 0.3,
              wordSpacing: 0.3,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  child: Text(
                    'Read More',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: kDarkOrange
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                    color: Colors.black38,
                    thickness: 1
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  HeaderWidget({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '$title',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24
            ),
          ),
        ),
        Expanded(
          child: Divider(
              color: Colors.black45,
              thickness: 1
          ),
        )
      ],
    );
  }
}
