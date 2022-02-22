import 'package:flutter/material.dart';
import 'package:u_note/screens/download_screen.dart';

class Item1 extends StatelessWidget {
  final String appBarText;
  const Item1({Key key, this.appBarText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DownloadScreen(
              appBarText: appBarText,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/Example2.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("جامعة الملك سعود",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold)),
            Text("الرياض",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  final String appBarText;
  const Item2({Key key, this.appBarText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DownloadScreen(
              appBarText: appBarText,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/Example3.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("جامعة الأمير سلطان",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold)),
            Text("الرياض",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
