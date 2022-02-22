import 'package:flutter/material.dart';
import 'package:u_note/components/University_Tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:u_note/screens/courses_screen.dart';

class UniversitiesScreen extends StatefulWidget {
  static const String id = 'universities_screen';
  final String loggedInEmail;
  UniversitiesScreen({this.loggedInEmail});

  @override
  _UniversitiesScreenState createState() => _UniversitiesScreenState();
}

class _UniversitiesScreenState extends State<UniversitiesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic> profileInfo = ({});
  final _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  String name = '';
  String email = '';
  String avatarCharacter = '';

  @override
  void initState() {
    firestoreInstance
        .collection('users')
        .where('email', isEqualTo: widget.loggedInEmail)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        profileInfo.addAll(result.data());
        name = profileInfo['name'];
        email = profileInfo['email'];
        avatarCharacter = profileInfo['name'][0];
        print(name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF4267B2),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              child: UniversityTile(
                title: 'جامعة الملك سعود',
                onPressed: () {},
                image: "ksulogo.png",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CoursesScreen(
                      appBarText: 'جامعة الملك سعود',
                      clickedUni: 'جامعة الملك سعود',
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              child: UniversityTile(
                title: 'جامعة الأمير سلطان',
                onPressed: () {},
                image: "psu.png",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CoursesScreen(
                      appBarText: 'جامعة الأمير سلطان',
                      clickedUni: 'جامعة الأمير سلطان',
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              child: UniversityTile(
                title: 'جامعة لإمام محمد بن سعود الإسلامية',
                onPressed: () {},
                image: "IMAM.png",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CoursesScreen(
                      appBarText: 'جامعة لإمام محمد بن سعود الإسلامية',
                      clickedUni: 'امعة لإمام محمد بن سعود الإسلامية',
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              child: UniversityTile(
                title: 'جامعة الملك فهد للبترول والمعادن',
                onPressed: () {},
                image: "KFUPMLOGO.png",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CoursesScreen(
                      appBarText: 'جامعة الملك فهد للبترول والمعادن',
                      clickedUni: 'جامعة الملك فهد للبترول والمعادن',
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              child: UniversityTile(
                title: 'جامعة الأميرة نورة بنت عبد الرحمن',
                onPressed: () {},
                image: "PNULOGO1.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CoursesScreen(
                        appBarText: 'جامعة الأميرة نورة بنت عبد الرحمن',
                        clickedUni: 'جامعة الأميرة نورة بنت عبد الرحمن',
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              child: UniversityTile(
                title: 'جامعة أم القرى',
                onPressed: () {},
                image: "UMMLOGO.png",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CoursesScreen(
                      appBarText: 'جامعة أم القرى',
                      clickedUni: 'جامعة أم القرى',
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              child: UniversityTile(
                title: 'جامعة الملك عبد العزيز',
                onPressed: () {},
                image: "KAU.png",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CoursesScreen(
                      appBarText: 'جامعة الملك عبد العزيز',
                      clickedUni: 'جامعة الملك عبد العزيز',
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              child: UniversityTile(
                title: 'الجامعة السعودية الالكترونية',
                onPressed: () {},
                image: "SEU.png",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CoursesScreen(
                      appBarText: 'الجامعة السعودية الالكترونية',
                      clickedUni: 'الجامعة السعودية الالكترونية',
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              child: UniversityTile(
                title: 'جامعة المعرفة',
                onPressed: () {},
                image: "MULOGO.png",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CoursesScreen(
                      appBarText: 'جامعة المعرفة',
                      clickedUni: 'جامعة المعرفة',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
