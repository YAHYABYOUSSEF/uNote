import 'package:flutter/material.dart';
import 'package:u_note/components/constant.dart';
import 'package:flutter/services.dart';
import 'package:u_note/components/rounded_button.dart';
import 'package:u_note/components/uploadFile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'rounded_button2.dart';

class UploadingScreen extends StatefulWidget {
  @override
  _UploadingScreenState createState() => _UploadingScreenState();
}

class _UploadingScreenState extends State<UploadingScreen> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey();

  String fileTitle;
  String subject;
  String university;
  String semester;
  String message;

  String chapterNo;
  String sectionNo;

  int option1 = 0;
  String defaultValue = 'اختيار الجامعة';

  changeView(int x) {
    setState(() {
      option1 = x;
    });
  }

  chapter() {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: RoundedButton2(
                          title: 'اختيار الصورة',
                          colour: Colors.white,
                          height: 25.0,
                          minWidth: 25.0,
                          borderRadius: 2.0,
                          onPressed: () {
                            getIMG();
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: RoundedButton2(
                          title: 'اختيار الملف',
                          colour: Colors.white,
                          height: 25.0,
                          minWidth: 25.0,
                          borderRadius: 2.0,
                          onPressed: () {
                            getPDF();
                          }),
                    ),
                  ),
                ],
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onChanged: (value) {
                  fileTitle = value.trim();
                },
                decoration:
                    kTextFieldDecoration2.copyWith(hintText: 'عنوان الملف'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onChanged: (value) {
                  subject = value.trim().toUpperCase();
                },
                decoration: kTextFieldDecoration2.copyWith(hintText: 'المادة'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                width: 550.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white30,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(2.0))),
                child: Center(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.blueGrey,
                    iconEnabledColor: Colors.white30,
                    value: defaultValue,
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(EvaIcons.arrowCircleDownOutline),
                    ),
                    iconSize: 33,
                    elevation: 16,
                    style: TextStyle(color: Colors.white, fontFamily: "Cairo"),
                    underline: Container(height: 2, color: kThemeColor),
                    onChanged: (String newValue) {
                      setState(() {
                        defaultValue = newValue;
                        university = defaultValue.toString();
                      });
                    },
                    items: <String>['اختيار الجامعة', 'PSU', 'KSU']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onChanged: (value) {
                  chapterNo = value.trim();
                },
                decoration: kTextFieldDecoration2.copyWith(hintText: 'الشابتر'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onChanged: (value) {
                  sectionNo = value.trim();
                },
                decoration: kTextFieldDecoration2.copyWith(hintText: 'السكشن'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onChanged: (value) {
                  semester = value.trim();
                },
                decoration:
                    kTextFieldDecoration2.copyWith(hintText: 'الفصل الدراسي'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onChanged: (value) {
                  message = value.trim();
                },
                decoration:
                    kTextFieldDecoration2.copyWith(hintText: 'رسالة للطلاب'),
                textAlign: TextAlign.center,
              ),
              RoundedButton(
                  title: 'ارفع',
                  colour: Colors.white,
                  onPressed: () {
                    documentFileUploadChapter(
                        urlPDF,
                        urlIMG,
                        fileTitle,
                        subject,
                        university,
                        chapterNo,
                        sectionNo,
                        semester,
                        message);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  fullNote() {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: RoundedButton2(
                          title: 'اختيار الصورة',
                          colour: Colors.white,
                          height: 25.0,
                          minWidth: 25.0,
                          borderRadius: 2.0,
                          onPressed: () {
                            getIMG();
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: RoundedButton2(
                          title: 'اختيار الملف',
                          colour: Colors.white,
                          height: 25.0,
                          minWidth: 25.0,
                          borderRadius: 2.0,
                          onPressed: () {
                            getPDF();
                          }),
                    ),
                  ),
                ],
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onChanged: (value) {
                  fileTitle = value.trim();
                },
                decoration:
                    kTextFieldDecoration2.copyWith(hintText: 'عنوان الملف'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onSaved: (value) {
                  subject = value.trim().toUpperCase();
                },
                decoration: kTextFieldDecoration2.copyWith(hintText: 'المادة'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                width: 550.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white30,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(2.0))),
                child: Center(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.blueGrey,
                    iconEnabledColor: Colors.white30,
                    value: defaultValue,
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(EvaIcons.arrowCircleDownOutline),
                    ),
                    iconSize: 33,
                    elevation: 16,
                    style: TextStyle(color: Colors.white, fontFamily: "Cairo"),
                    underline: Container(height: 2, color: kThemeColor),
                    onChanged: (String newValue) {
                      setState(() {
                        defaultValue = newValue;
                        university = defaultValue.toString();
                      });
                    },
                    items: <String>['اختيار الجامعة', 'PSU', 'KSU']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onChanged: (value) {
                  semester = value.toString();
                },
                decoration:
                    kTextFieldDecoration2.copyWith(hintText: 'الفصل الدراسي'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return ('الرجاء ملء الحقل');
                  }
                  return null;
                },
                onChanged: (value) {
                  message = value..trim();
                },
                decoration:
                    kTextFieldDecoration2.copyWith(hintText: 'رسالة للطلاب'),
                textAlign: TextAlign.center,
              ),
              RoundedButton(
                  title: 'ارفع',
                  colour: Colors.white,
                  onPressed: () {
                    documentFileUploadFN(urlPDF, urlIMG, fileTitle, subject,
                        university, semester, message);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  choose() {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundedButton2(
              title: 'شابتر محدد',
              colour: Colors.white,
              height: 25.0,
              minWidth: 100,
              borderRadius: 2.0,
              fontSize: 30.0,
              onPressed: () {
                changeView(1);
              }),
          RoundedButton2(
              title: 'مذكرة كاملة',
              colour: Colors.white,
              height: 25.0,
              minWidth: 100.0,
              borderRadius: 2.0,
              fontSize: 30.0,
              onPressed: () {
                changeView(2);
              }),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return (option1 == 0) ? choose() : (option1 == 1) ? chapter() : fullNote();
    // Form(
    //   key: _formKey,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Column(
    //         children: <Widget>[
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Center(
    //                 child: RaisedButton(
    //                   onPressed: () {
    //                     setState(() {
    //                       option1 = true;
    //                     });
    //                   },
    //                   child: Text(
    //                     'شابتر محدد',
    //                     style: TextStyle(fontSize: 20),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 width: 15.0,
    //               ),
    //               Center(
    //                 child: RaisedButton(
    //                   onPressed: () {
    //                     setState(() {
    //                       option1 = false;
    //                     });
    //                   },
    //                   child: Text(
    //                     'مذكرة كاملة',
    //                     style: TextStyle(fontSize: 20),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 20.0,
    //             width: 550.0,
    //             child: Divider(
    //               color: Colors.white,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
  }
}
