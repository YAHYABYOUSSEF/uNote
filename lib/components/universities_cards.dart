import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:u_note/screens/courses_screen.dart';
import 'package:u_note/screens/universities_screen.dart';

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CoursesScreen(
              appBarText: 'جامعة الملك سعود',
              clickedUni: 'KSU',
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/ksu.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("جامعة الملك سعود",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold)),
            Text("الرياض",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CoursesScreen(
              appBarText: 'جامعة الأمير سلطان',
              clickedUni: 'PSU',
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/psu.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("جامعة الأمير سلطان",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold)),
            Text("الرياض",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
