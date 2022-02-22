import 'package:flutter/material.dart';
import 'package:u_note/components/constant.dart';
import 'package:u_note/components/downloads_cards.dart';
import 'package:u_note/screens/universities_screen.dart';

class DownloadsScreen extends StatefulWidget {
  static const String id = 'downloads_screen';
  @override
  _DownloadsScreenState createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('المكتبة'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: InputDecoration(
                labelText: '',
                hintText: '',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: DownloadsCards(
              appBarText: 'المكتبة',
            ),
          ),
        ],
      ),
    );
  }
}
