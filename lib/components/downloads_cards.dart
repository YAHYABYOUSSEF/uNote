import 'package:flutter/material.dart';
import 'package:u_note/components/constant.dart';
import 'package:u_note/screens/download_screen.dart';

class DownloadsCards extends StatelessWidget {
  final String appBarText;
  DownloadsCards({this.appBarText});

  title(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  subtitle(subTitle) {
    return Text(
      subTitle,
      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w200),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  thumbnail(imageURL) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Image(
        image: NetworkImage(imageURL),
        height: 110,
        width: 120,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }

  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.grey,
      size: 30.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: GestureDetector(
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
            child: ListTile(
              title: title('CS101 by Mohamed Ahmed'),
              leading: thumbnail(imageLink2),
              trailing: rightIcon(),
              contentPadding: EdgeInsets.all(5.0),
            ),
          ),
        ),
        Card(
          child: GestureDetector(
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
            child: ListTile(
              title: title('CS201 - 191'),
              leading: thumbnail(imageLink),
              trailing: rightIcon(),
              contentPadding: EdgeInsets.all(5.0),
            ),
          ),
        ),
        Card(
          child: GestureDetector(
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
            child: ListTile(
              title: title('SE201 / Dr. Ahmed'),
              leading: thumbnail(imageLink2),
              trailing: rightIcon(),
              contentPadding: EdgeInsets.all(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
