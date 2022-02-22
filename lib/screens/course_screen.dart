import 'package:flutter/material.dart';
import 'package:u_note/components/constant.dart';
import 'package:u_note/components/course_cards.dart';
import 'universities_screen.dart';

class CourseScreen extends StatefulWidget {
  static const String id = 'course_screen';

  final String appBarText;
  final String clickedSubject;

  CourseScreen({this.appBarText, this.clickedSubject});

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarWithHome(context, widget.appBarText),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CourseCards(
              appBarText: widget.appBarText,
              clickedSubject: widget.clickedSubject,
            ),
          ),
        ],
      ),
    );
  }
}
