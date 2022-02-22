import 'package:flutter/material.dart';
import 'package:u_note/components/uploadScreen.dart';

class UploadScreen extends StatefulWidget {
  static const String id = 'upload_screen';
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(color: Color(0xFF4267B2), child: UploadingScreen()),
    );
  }
}
// onPressed: () {
// documentFileUploadFN(urlPDF, urlIMG, fileTitle, subject,
// university, semester, message);
// },
