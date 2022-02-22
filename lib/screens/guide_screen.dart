import 'package:flutter/material.dart';
import 'package:u_note/components/rounded_button.dart';
import 'dart:async';
import 'package:u_note/components/slide.dart';
import 'package:u_note/components/slide_dots.dart';
import 'package:u_note/components/slide_item.dart';
import 'package:u_note/screens/login_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class GuideScreen extends StatefulWidget {
  static const String id = 'guide_screen';
  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF4267B2),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: RoundedButton(
                      title: "إبدأ",
                      colour: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                    ),
                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        'Have an account?',
//                        style: TextStyle(
//                          fontSize: 18,
//                        ),
//                      ),
//                      FlatButton(
//                        child: Text(
//                          'Login',
//                          style: TextStyle(fontSize: 18),
//                        ),
//                        onPressed: () {
//                          Navigator.of(context).pushNamed(LoginScreen.id);
//                        },
//                      ),
//                    ],
//                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
