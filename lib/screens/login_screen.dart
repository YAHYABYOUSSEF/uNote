import 'package:flutter/material.dart';
import 'package:u_note/components/rounded_button.dart';
import 'package:u_note/components/constant.dart';
import 'package:provider/provider.dart';
import 'package:u_note/models/authentication.dart';
import 'package:u_note/screens/main_screen.dart';
import 'package:u_note/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool showSpinner = false;
//------------------------------------------------------------------------------
  final _auth = FirebaseAuth.instance;
//------------------------------------------------------------------------------
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
//------------------------------------------------------------------------------
  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Error Occurred'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .logIn(_authData['email'], _authData['password']);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              MainScreen(loggedInEmail: _authData['email']),
        ),
      );
    } catch (error) {
      var errorMessage = 'Authentication Failed, try again later';
      _showErrorDialog(errorMessage);
    }
  }
//------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4267B2),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/untitled.png'),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'البريد الإلكتروني'),
                      onSaved: (value) {
                        _authData['email'] = value.trim();
                      },
                      onChanged: (value) {
                        _authData['email'] = value.trim();
                      },
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return ('الرجاء إدخال بريد إلكتروني صحيح');
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'كلمة المرور'),
                      onSaved: (value) {
                        _authData['password'] = value.trim();
                      },
                      onChanged: (value) {
                        _authData['password'] = value.trim();
                      },
                      validator: (value) {
                        if (value.isEmpty || value.length <= 5) {
                          return 'الرجاء إدخال كلمة مرور صحيحة';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RoundedButton(
                        title: 'الدخول',
                        colour: Colors.white,
                        onPressed: () async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: _authData['email'],
                                password: _authData['password']);
                            if (user != null) {
                              Navigator.pushNamed(context, MainScreen.id);
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setInt('user', 1);
                            }
                          } catch (e) {
                            print(e);
                          }
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'انشاء حساب',
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, RegistrationScreen.id);
                          },
                        ),
                        Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 18,
                            color: Colors.white30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
