import 'package:flutter/material.dart';
import 'package:u_note/screens/downloads_screen.dart';
import 'package:u_note/screens/favorite_screen.dart';
import 'package:u_note/screens/login_screen.dart';
import 'package:u_note/screens/profile_screen.dart';
import 'package:u_note/screens/universities_screen.dart';
import 'package:u_note/screens/upload_screen.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.white30, fontFamily: "Cairo"),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
      // borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white30, width: 1.0),
    // borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    // borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTextFieldDecoration2 = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.white30, fontFamily: "Cairo"),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white30, width: 1.0),
    // borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    // borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTextFieldDecorationEdit = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.white30, fontFamily: "Cairo"),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
      // borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white30, width: 1.0),
    // borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    // borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kContainerDecoration = BoxDecoration(
  border: Border.all(
    color: Colors.white30,
  ),
);

createContainer(String text) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    width: 550.0,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(2.0))),
    child: Text(
      text,
      style:
          TextStyle(color: Colors.white, fontFamily: "Cairo", fontSize: 15.0),
      textAlign: TextAlign.center,
    ),
  );
}

const kAppBarTextStyle = TextStyle(
  color: Colors.white,
);

const kTryTitle = Text(
  'Lorem Ipsum',
  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
);

const kTrySubText = Text(
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis sodales urna nec dictum. Fusce eget quam tincidunt arcu lobortis facilisis. Nulla facilisi. Aliquam porta neque non fermentum sodales. Curabitur vitae aliquet quam. Nunc sit amet facilisis mi. Phasellus fermentum fermentum aliquet. Ut sit amet varius tortor. Curabitur vestibulum justo non sapien cursus, eu bibendum neque fermentum. Vivamus sagittis leo ac volutpat accumsan. In ac commodo nulla. Curabitur placerat eleifend accumsan. Etiam porta orci nec egestas elementum',
  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
);

String imageLink =
    'https://p.calameoassets.com/120611080311-273ec90a2704cd09c6d0f10a5e814290/p1.jpg';

String imageLink2 =
    'https://online.fliphtml5.com/xmlae/rheq/files/large/1.jpg?1591903900';
const kThemeColor = Color(0xFF4267B2);

const kTrySubString =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis sodales urna nec dictum. Fusce eget quam tincidunt arcu lobortis facilisis. Nulla facilisi. Aliquam porta neque non fermentum sodales. Curabitur vitae aliquet quam. Nunc sit amet facilisis mi.';

AppBar createAppBarWithHome(BuildContext context, String text) {
  return AppBar(
    title: Text(
      text,
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.chevron_left),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        );
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.home,
        ),
        color: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, UniversitiesScreen.id);
        },
      )
    ],
  );
}

AppBar createAppBar(String text) {
  return AppBar(
    title: Text(
      text,
      style: kAppBarTextStyle,
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.chevron_left),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        );
      },
    ),
  );
}

AlertDialog createAlertOneButton(
    BuildContext context, String title, String content) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
    ],
  );
}

String getErrorMessage(@required String message) {
  Text(
    message,
    textAlign: TextAlign.right,
    style: TextStyle(fontFamily: "Cairo"),
  );

  return getErrorMessage(message);
}

//check the sign out button
Drawer getMainDrawer(
    String name, String email, String avatarCharacter, BuildContext context) {
  return Drawer(
    child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(name),
          accountEmail: Text(email),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Color(0xFF4267B2),
            child: Text(
              avatarCharacter.toUpperCase(),
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProfileScreen.id);
          },
          child: ListTile(
            title: Text(
              'الملف الشخصي',
              textDirection: TextDirection.rtl,
            ),
            trailing: Icon(
              Icons.person,
              color: Color(0xFF4267B2),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, FavoriteScreen.id);
          },
          child: ListTile(
            title: Text(
              'المفضلة',
              textDirection: TextDirection.rtl,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Color(0xFF4267B2),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, DownloadsScreen.id);
          },
          child: ListTile(
            title: Text(
              'المكتبة',
              textDirection: TextDirection.rtl,
            ),
            trailing: Icon(
              Icons.library_books,
              color: Color(0xFF4267B2),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, UploadScreen.id);
          },
          child: ListTile(
            title: Text(
              'الرفع',
              textDirection: TextDirection.rtl,
            ),
            trailing: Icon(
              Icons.file_upload,
              color: Color(0xFF4267B2),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.id);
            // _auth.signOut();
          },
          child: ListTile(
            title: Text(
              'تسجيل الخروج',
              textDirection: TextDirection.rtl,
            ),
            trailing: Icon(
              Icons.close,
              color: Color(0xFF4267B2),
            ),
          ),
        ),
      ],
    ),
  );
}
