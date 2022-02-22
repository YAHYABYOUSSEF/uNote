import 'package:flutter/material.dart';
import 'package:u_note/screens/login_screen.dart';
import 'constant.dart';
import 'rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'rounded_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  final String loggedInEmail;
  EditProfile({this.loggedInEmail});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Map<String, dynamic> profileInfo = ({});
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = TextEditingController();
  int condition = 0;
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  String name = '';
  String uni = '';
  String department = '';
  String email = '';
  String password = '';
  String docId = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    db
        .collection('users')
        .where('email', isEqualTo: widget.loggedInEmail)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        docId = result.id;
        profileInfo.addAll(result.data());
        setData();
      });
    });
  }

  setData() {
    setState(() {
      name = profileInfo['name'];
      uni = profileInfo['university'];
      department = profileInfo['department'];
      email = profileInfo['email'];
      password = profileInfo['password'];
      print(uni);
    });
  }

  viewProfile() {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'الاسم',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(child: createContainer(name)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(
                        'الجامعة',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(child: createContainer(uni)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(
                        'الكلية',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(child: createContainer(department)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(
                        'البريد الإلكتروني',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(child: createContainer(department)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'كلمة المرور',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(child: createContainer(password)),
                ],
              ),
            ),
            RoundedButton(
              title: 'التعديل',
              colour: Colors.white,
              onPressed: () {
                setState(() {
                  condition = 1;
                });
                getData();
              },
            ),
          ],
        ),
      ),
    );
  }

  editProfile() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'الاسم',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      initialValue: name,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(hintText: name),
                      onChanged: (value) {
                        name = value;
                      },
                      onSaved: (value) {
                        name = value;
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(
                        'الجامعة',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      initialValue: uni,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(hintText: uni),
                      onChanged: (value) {
                        uni = value;
                      },
                      onSaved: (value) {
                        uni = value;
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(
                        'الكلية',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      initialValue: department,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: department),
                      onChanged: (value) {
                        department = value;
                      },
                      onSaved: (value) {
                        department = value;
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(
                        'البريد الإلكتروني',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      initialValue: email,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: email),
                      onChanged: (value) {
                        email = value;
                      },
                      onSaved: (value) {
                        email = value;
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'كلمة المرور',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      initialValue: password,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: password),
                      onChanged: (value) {
                        password = value;
                      },
                      onSaved: (value) {
                        password = value;
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
                  ),
                ],
              ),
            ),
            RoundedButton(
              title: 'حفظ',
              colour: Colors.white,
              onPressed: () {
                editData();
                setState(() {
                  condition = 0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  editData() async {
    await db.collection('users').doc(docId).set({
      'name': name,
      'university': uni,
      'department': department,
      'email': email,
      'password': password
    });
    _showErrorDialog('تم تعديل بيانات الملف الشخصي بنجاح');
  }

  _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('لقد تمت العملية'),
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

  @override
  Widget build(BuildContext context) {
    return (condition == 0) ? viewProfile() : editProfile();
  }
}
