import 'package:flutter/material.dart';
import 'package:u_note/components/constant.dart';
import 'course_screen.dart';
import 'package:firebase_database/firebase_database.dart';

class CoursesScreen extends StatefulWidget {
  static const String id = 'courses_screen';
  final String appBarText;
  final String clickedUni;
  CoursesScreen({this.appBarText, this.clickedUni});

  @override
  _CoursesScreen createState() => _CoursesScreen();
}

class _CoursesScreen extends State<CoursesScreen> {
  TextEditingController editingController = TextEditingController();
  final mainReference = FirebaseDatabase.instance.reference();

  String clickedSubject;
  static List<String> courses = List();
  List<String> newCourses = List();

  setSubject(int index) {
    clickedSubject = newCourses[index];
  }

  onItemChanged(String value) {
    setState(() {
      newCourses = courses
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    mainReference.once().then((DataSnapshot snap) {
      setState(() {
        var data = snap.value;
        courses.clear();
        data.forEach((key, value) {
          if (value['University'] == widget.clickedUni) {
            courses.add(value['Subject']);
          }
        });
        // print('Value is ');
        // print(courses.length);
        // print(courses);
        newCourses = List.from(courses);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarWithHome(context, widget.appBarText),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text("تصفح"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            title: Text("إرفع"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("حسابي"),
          ),
        ],
        selectedItemColor: Color(0xFF4267B2),
        iconSize: 25.0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: onItemChanged,
              controller: editingController,
              decoration: InputDecoration(
                labelText: '',
                hintText: '',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: ListView(
          //     children: newCourses.map((data) {
          //       return ListTile(
          //         title: Text(data),
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (BuildContext context) =>
          //                   CourseScreen(appBarText: widget.appBarText,),
          //             ),
          //           );
          //         },
          //       );
          //     }).toList(),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: newCourses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(newCourses[index]),
                  onTap: () {
                    setSubject(index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CourseScreen(
                          appBarText: widget.appBarText,
                          clickedSubject: clickedSubject,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
