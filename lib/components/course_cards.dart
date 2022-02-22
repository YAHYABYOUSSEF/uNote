import 'package:flutter/material.dart';
import 'package:u_note/screens/download_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:u_note/models/noteCards.dart';

// class CourseCards extends StatelessWidget {
//   final String appBarText;
//   final String clickedSubject;
//   CourseCards({this.appBarText, this.clickedSubject});
//   title(title) {
//     return Text(
//       title,
//       style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//     );
//   }
//
//   subtitle(subTitle) {
//     return Text(
//       subTitle,
//       style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w200),
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//     );
//   }
//
//   thumbnail(imageURL) {
//     return Padding(
//       padding: EdgeInsets.only(left: 15.0),
//       child: Image(
//         image: NetworkImage(imageURL),
//         height: 60,
//         width: 90,
//         alignment: Alignment.center,
//         fit: BoxFit.fill,
//       ),
//     );
//   }
//
//   rightIcon() {
//     print(clickedSubject);
//     return Icon(
//       Icons.keyboard_arrow_right,
//       color: Colors.grey,
//       size: 30.0,
//     );
//   }
//
//   Card createCard(
//       BuildContext context, String text, String subText, String link) {
//     return Card(
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) => DownloadScreen(
//                 appBarText: appBarText,
//               ),
//             ),
//           );
//         },
//         child: ListTile(
//           title: title(text),
//           subtitle: subtitle(subText),
//           leading: thumbnail(link),
//           trailing: rightIcon(),
//           contentPadding: EdgeInsets.all(5.0),
//         ),
//       ),
//     );
//   }
//
//   final mainReference = FirebaseDatabase.instance.reference();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         createCard(context, 'Title Placeholder', 'this is the subText part',
//             imageLink),
//         createCard(context, 'Title Placeholder', 'this is the subText part',
//             imageLink),
//         createCard(context, 'Title Placeholder', 'this is the subText part',
//             imageLink),
//         createCard(context, 'Title Placeholder', 'this is the subText part',
//             imageLink),
//         createCard(context, 'Title Placeholder', 'this is the subText part',
//             imageLink),
//         createCard(context, 'Title Placeholder', 'this is the subText part',
//             imageLink),
//       ],
//     );
//   }
// }

class CourseCards extends StatefulWidget {
  final String appBarText;
  final String clickedSubject;

  CourseCards({this.appBarText, this.clickedSubject});

  @override
  _CourseCardsState createState() => _CourseCardsState();
}

class _CourseCardsState extends State<CourseCards> {
  final mainReference = FirebaseDatabase.instance.reference();

  String text = '';
  String subText = '';
  String link = '';

  List<NoteCards> clickedNotes = List();
  String clickedNoteTitle;

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
        height: 60,
        width: 90,
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
  void initState() {
    mainReference.once().then((DataSnapshot snap) {
      setState(() {
        var data = snap.value;
        clickedNotes.clear();
        data.forEach((key, value) {
          if (value['Subject'] == widget.clickedSubject) {
            text = value['FileName'];
            subText = value['Message'];
            link = value['IMG'];
            NoteCards n = NoteCards(text: text, subText: subText, image: link);
            clickedNotes.add(n);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: clickedNotes.length,
        itemBuilder: (context, index) {
          return Card(
            child: GestureDetector(
              onTap: () {
                clickedNoteTitle = clickedNotes[index].text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DownloadScreen(
                      appBarText: widget.appBarText,
                      clickedFile: clickedNoteTitle,
                    ),
                  ),
                );
              },
              child: ListTile(
                title: title(text),
                subtitle: subtitle(subText),
                leading: thumbnail(link),
                trailing: rightIcon(),
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
          );
        });
  }
}
