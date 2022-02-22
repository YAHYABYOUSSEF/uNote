import 'package:flutter/material.dart';
import 'package:u_note/components/constant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_database/firebase_database.dart';

class DownloadScreen extends StatefulWidget {
  static const String id = 'download_screen';
  final String appBarText;
  final String clickedFile;
  DownloadScreen({this.appBarText, this.clickedFile});

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final mainReference = FirebaseDatabase.instance.reference();

  var currentButtonStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xFF4267B2),
  );
  var otherButtonStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
  bool pressed = true;
  bool pressed2 = true;

  String title = '';
  String subject = '';
  String semester = '';
  String message = '';
  String img = '';
  String pdf = '';

  String chapter = '';
  String section = '';

  Container withBG(String text) {
    return Container(
      height: 30.0,
      color: Colors.grey.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Container withoutBG(String text) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutContainer() {
    return Column(
      children: <Widget>[
        withBG(' $subject  : المادة'),
        withoutBG(' $semester  : الفصل الدراسي'),
        withBG(' $chapter  : الشابتر'),
        withoutBG(' $section  : السكشن'),
      ],
    );
  }

  Widget messageContainer(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 15.0, color: Colors.black),
      ),
    );
  }

  @override
  void initState() {
    mainReference.once().then((DataSnapshot snap) {
      setState(() {
        var data = snap.value;
        data.forEach((key, value) {
          if (value['FileName'] == widget.clickedFile) {
            title = value['FileName'];
            subject = value['Subject'];
            semester = value['Semester'];
            message = value['Message'];
            img = value['IMG'];
            pdf = value['PDF'];

            if (value['Chapter'] == null) {
              chapter = '-';
              section = '-';
            }
          }
        });
      });
      print('$title , $subject, $semester, $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarWithHome(context, widget.appBarText),
      body: ListView(
        children: <Widget>[
          //Image Container
          Container(
            height: 250.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image(
                  image: NetworkImage(img),
                ),
              ),
            ),
          ),
          //Title and Download icon container
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.file_download,
                      color: kThemeColor,
                      size: 35.0,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 15.0, top: 0.0),
          //   alignment: Alignment.bottomLeft,
          //   child: Text(
          //     'Mohamed Ahmed',
          //     style: TextStyle(
          //       fontWeight: FontWeight.normal,
          //       color: Colors.grey,
          //     ),
          //     textAlign: TextAlign.left,
          //   ),
          // ),
          //Rating container
          Container(
            margin: EdgeInsets.only(left: 11.0),
            alignment: Alignment.bottomLeft,
            child: RatingBar(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 25.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: kThemeColor,
              ),
              onRatingUpdate: (rating) {
                print(widget.clickedFile);
              },
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: kThemeColor,
            ),
          ),
          //Bottom Container
          Container(
            height: 200.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 55.0),
                          child: FlatButton(
                            child: Text(
                              'رسالة من الطالب',
                              style: pressed
                                  ? otherButtonStyle
                                  : currentButtonStyle,
                            ),
                            onPressed: () {
                              setState(() {
                                pressed = !pressed;
                                pressed2 = !pressed2;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 55.0),
                          child: FlatButton(
                            child: Text(
                              'عن الملخص',
                              style: pressed
                                  ? currentButtonStyle
                                  : otherButtonStyle,
                            ),
                            onPressed: () {
                              setState(() {
                                pressed = !pressed;
                                pressed2 = !pressed2;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 550.0,
                      child: Divider(
                        color: kThemeColor,
                      ),
                    ),
                    pressed2 ? aboutContainer() : messageContainer(message)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
