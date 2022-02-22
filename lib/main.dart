import 'package:flutter/material.dart';
import 'package:u_note/screens/course_screen.dart';
import 'package:u_note/screens/courses_screen.dart';
import 'package:u_note/screens/download_screen.dart';
import 'package:u_note/screens/guide_screen.dart';
import 'package:u_note/screens/login_screen.dart';
import 'package:u_note/screens/main_screen.dart';
import 'package:u_note/screens/profile_screen.dart';
import 'package:u_note/screens/registration_screen.dart';
import 'package:u_note/screens/universities_screen.dart';
import 'package:u_note/screens/upload_screen.dart';
import 'package:u_note/screens/welcome_screen.dart';
import 'screens/downloads_screen.dart';
import 'screens/favorite_screen.dart';
import 'package:provider/provider.dart';
import 'package:u_note/models/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getInt('user');
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        )
      ],
      child: MaterialApp(
        initialRoute: (user == null)
            ? WelcomeScreen.id
            : (user == 1) ? MainScreen.id : LoginScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          GuideScreen.id: (context) => GuideScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          UniversitiesScreen.id: (context) => UniversitiesScreen(),
          CoursesScreen.id: (context) => CoursesScreen(),
          CourseScreen.id: (context) => CourseScreen(),
          DownloadScreen.id: (context) => DownloadScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          UploadScreen.id: (context) => UploadScreen(),
          DownloadsScreen.id: (context) => DownloadsScreen(),
          FavoriteScreen.id: (context) => FavoriteScreen(),
        },
        theme: ThemeData(
          errorColor: Color(0xFFff7675),
          fontFamily: "Cairo",
        ),
      )));
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}
