import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:u_note/screens/guide_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/untitled.png'),
              width: 200.0,
              height: 150.0,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: FlatButton(
                child: Text(
                  'أبدأ الأن',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.only(left: 50, right: 50),
                color: Color(0xFF4267B2),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, GuideScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
