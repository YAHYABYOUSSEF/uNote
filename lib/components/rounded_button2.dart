import 'package:flutter/material.dart';

class RoundedButton2 extends StatelessWidget {
  RoundedButton2(
      {this.title,
      this.colour,
      this.onPressed,
      textStyle,
      this.borderRadius,
      this.height,
      this.minWidth,
      this.fontSize});

  final Color colour;
  final String title;
  final Function onPressed;
  final double borderRadius;
  final double minWidth;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: minWidth,
          height: height,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: "Cairo",
              color: Color(0xFF4267B2),
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
