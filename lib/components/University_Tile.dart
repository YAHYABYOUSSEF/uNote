import 'package:flutter/material.dart';

class UniversityTile extends StatelessWidget {
  UniversityTile({this.title, this.image, this.onPressed, onTap});

  final String image;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          "images/$image",
          alignment: Alignment.centerLeft,
        ),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontFamily: "Cairo"),
        ),
      ),
    );
  }
}
