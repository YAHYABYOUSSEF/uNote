import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:u_note/components/rounded_button.dart';
import 'package:u_note/components/constant.dart';
import 'package:provider/provider.dart';
import 'package:u_note/models/authentication.dart';
import 'package:u_note/screens/login_screen.dart';
import 'package:u_note/screens/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
//------------------------------------------------------------------------------
  final _firestore = FirebaseFirestore.instance;
  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('حدث خطأ'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  child: Text('نعم'),
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
          .signUp(_authData['email'], _authData['password']);
      createProfile();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MainScreen(
            loggedInEmail: _authData['email'],
          ),
        ),
      );
    } catch (error) {
      if (error == 'EMAIL_EXISTS') {
        var errorMessage = 'هذا البريد مسجل سابقا';
        _showErrorDialog(errorMessage);
      } else {
        var errorMessage = 'حاول مرة اخرى لاحقا';
        _showErrorDialog(errorMessage);
        print(error);
      }
    }
  }

//------------------------------------------------------------------------------
  String name;
  String university;
  String department;
  String email;
  String password;
  createProfile() {
    _firestore.collection('users').add({
      'name': name,
      'university': university,
      'department': department,
      'email': email,
      'password': password,
    });
  }

//------------------------------------------------------------------------------
  final _auth = FirebaseAuth.instance;
//------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4267B2),
        automaticallyImplyLeading: false,
        leading: Hero(child: Image.asset('images/untitled.png'), tag: 'logo'),
        elevation: 0.0,
      ),
      backgroundColor: kThemeColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("إنشاء حساب جديد",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      //Name
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration:
                            kTextFieldDecoration.copyWith(hintText: 'الإسم'),
                        onSaved: (value) {
                          name = value.trim();
                        },
                        onChanged: (value) {
                          name = value.trim();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return ('الرجاء إدخال إسم');
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
                      //University
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration:
                            kTextFieldDecoration.copyWith(hintText: 'الجامعة'),
                        onSaved: (value) {
                          university = value.trim();
                        },
                        onChanged: (value) {
                          university = value.trim();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return ('الرجاء إدخال إسم الجامعة');
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
                      //Department
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration:
                            kTextFieldDecoration.copyWith(hintText: 'الكلية'),
                        onSaved: (value) {
                          department = value.trim();
                        },
                        onChanged: (value) {
                          department = value.trim();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return ('الرجاء إدخال الكلية');
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
                      //Email
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'البريد الإلكتروني'),
                        onSaved: (value) {
                          _authData['email'] = value.trim();
                          email = value.trim();
                        },
                        onChanged: (value) {
                          _authData['email'] = value.trim();
                          email = value.trim();
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
                      //Password
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        controller: _passwordController,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'كلمة المرور'),
                        onSaved: (value) {
                          _authData['password'] = value.trim();
                          password = value.trim();
                        },
                        onChanged: (value) {
                          _authData['password'] = value.trim();
                          password = value.trim();
                        },
                        validator: (value) {
                          if (value.isEmpty ||
                              value != _passwordController.text) {
                            return 'الرجاء إدخال كلمة مرور';
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
                      //Confirm Password
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'تأكيد كلمة المرور'),
                        onSaved: (value) {
                          _authData['password'] = value.trim();
                          password = value.trim();
                        },
                        onChanged: (value) {
                          _authData['password'] = value.trim();
                          password = value.trim();
                        },
                        validator: (value) {
                          if (value.isEmpty || value.length <= 5) {
                            return 'كلمات المرور غير متطابقة';
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
                        title: 'التسجيل',
                        colour: Colors.white,
                        onPressed: () async {
                          try {
                            print(email);
                            print(password);
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (newUser != null) {
                              createProfile();
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setInt('user', 1);
                              Navigator.pushNamed(context, MainScreen.id);
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            child: Text(
                              'سجل دخولك',
                              style: TextStyle(
                                fontFamily: "Cairo",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                          ),
                          Text(
                            'لديك حساب؟',
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 18,
                              color: Colors.white38,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
