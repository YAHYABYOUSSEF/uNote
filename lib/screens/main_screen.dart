import 'package:flutter/material.dart';
import 'package:u_note/screens/upload_screen.dart';
import 'universities_screen.dart';
import 'profile_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  final String loggedInEmail;
  MainScreen({this.loggedInEmail});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  //----> Bottom NavBar
  int _selectedTap = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedTap = index;
    });
  }

  String _currentTitle(int index) {
    if (index == 0) {
      return ('الجامعات');
    } else if (index == 1) {
      return ('الرفع');
    } else {
      return ('الملف الشخصي');
    }
  }
  //----------------------

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          _currentTitle(_selectedIndex),
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       title: Text("تصفح"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.file_upload),
      //       title: Text("إرفع"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle),
      //       title: Text("حسابي"),
      //     ),
      //   ],
      //   onTap: _onItemTapped,
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Color(0xFF4267B2),
      //   iconSize: 25.0,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          (_selectedTap == 0)
              ? UniversitiesScreen(
                  loggedInEmail: widget.loggedInEmail,
                )
              : (_selectedTap == 1)
                  ? UploadScreen()
                  : ProfileScreen(
                      loggedInEmail: widget.loggedInEmail,
                    ),
          CustomNavigationBar(
            backgroundColor: Colors.white,
            unSelectedColor: Colors.grey,
            selectedColor: Color(0xFF4267B2),
            strokeColor: Colors.white10,
            iconSize: 30,
            items: [
              CustomNavigationBarItem(
                icon: EvaIcons.searchOutline,
              ),
              CustomNavigationBarItem(
                icon: EvaIcons.cloudUploadOutline,
              ),
              CustomNavigationBarItem(
                icon: EvaIcons.personOutline,
              ),
            ],
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
          )
        ],
      ),
    );
  }
}
