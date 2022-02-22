import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

final mainReference = FirebaseDatabase.instance.reference();

String urlPDF;
String urlIMG;

String getRandom() {
  var rng = new Random();
  String randomName = "";
  for (var i = 0; i < 20; i++) {
    print(rng.nextInt(100));
    randomName += rng.nextInt(100).toString();
  }
  return randomName;
}

//------------------------------------------------------------------------------
Future getPDF() async {
  File file = await FilePicker.getFile(type: FileType.custom);
  String name = getRandom();
  String fileName = '$name.pdf';
  savePdf(file.readAsBytesSync(), fileName);
}

savePdf(List<int> asset, String namePDF) async {
  StorageReference reference = FirebaseStorage.instance.ref().child(namePDF);
  StorageUploadTask uploadTask = reference.putData(asset);
  urlPDF = await (await uploadTask.onComplete).ref.getDownloadURL();
}

//------------------------------------------------------------------------------
Future getIMG() async {
  File file = await FilePicker.getFile(type: FileType.custom);
  String name = getRandom();
  String fileName = '$name.png';
  saveIMG(file.readAsBytesSync(), fileName);
}

saveIMG(List<int> asset, String nameIMG) async {
  StorageReference reference = FirebaseStorage.instance.ref().child(nameIMG);
  StorageUploadTask uploadTask = reference.putData(asset);
  urlIMG = await (await uploadTask.onComplete).ref.getDownloadURL();
}

//------------------------------------------------------------------------------
String CreateCryptoRandomString([int length = 32]) {
  final Random _random = Random.secure();
  var values = List<int>.generate(length, (i) => _random.nextInt(256));
  return base64Url.encode(values);
}

void documentFileUploadFN(String strPDF, String strIMG, String fileName,
    String subject, String university, String semester, String message) {
  var data = {
    'PDF': strPDF,
    'IMG': strIMG,
    'FileName': fileName,
    'Subject': subject,
    'University': university,
    'Semester': semester,
    'Message': message,
  };
  mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
    print("Store Successfully");
  });
}

void documentFileUploadChapter(
    String strPDF,
    String strIMG,
    String fileName,
    String subject,
    String university,
    String chapter,
    String section,
    String semester,
    String message) {
  var data = {
    'PDF': strPDF,
    'IMG': strIMG,
    'FileName': fileName,
    'Subject': subject,
    'University': university,
    'Chapter': chapter,
    'Section': section,
    'Semester': semester,
    'Message': message,
  };
  mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
    print("Store Successfully");
  });
}

//------------------------------------------------------------------------------
//String getRandom() {
//  var rng = new Random();
//  String randomName = "";
//  for (var i = 0; i < 20; i++) {
//    print(rng.nextInt(100));
//    randomName += rng.nextInt(100).toString();
//  }
//  return randomName;
//}
//
////------------------------------------------------------------------------------
//Future getPDF() async {
//  File file = await FilePicker.getFile(type: FileType.custom);
//  String name = getRandom();
//  String fileName = '$name.pdf';
//  savePdf(file.readAsBytesSync(), fileName);
//}
//
//savePdf(List<int> asset, String namePDF) async {
//  StorageReference reference = FirebaseStorage.instance.ref().child(namePDF);
//  StorageUploadTask uploadTask = reference.putData(asset);
//  urlPDF = await (await uploadTask.onComplete).ref.getDownloadURL();
//}
//
////------------------------------------------------------------------------------
//Future getIMG() async {
//  File file = await FilePicker.getFile(type: FileType.custom);
//  String name = getRandom();
//  String fileName = '$name.png';
//  saveIMG(file.readAsBytesSync(), fileName);
//}
//
//saveIMG(List<int> asset, String nameIMG) async {
//  StorageReference reference = FirebaseStorage.instance.ref().child(nameIMG);
//  StorageUploadTask uploadTask = reference.putData(asset);
//  urlIMG = await (await uploadTask.onComplete).ref.getDownloadURL();
//}
//
////------------------------------------------------------------------------------
//String CreateCryptoRandomString([int length = 32]) {
//  final Random _random = Random.secure();
//  var values = List<int>.generate(length, (i) => _random.nextInt(256));
//  return base64Url.encode(values);
//}
//
//void documentFileUpload(String strPDF, String strIMG) {
//  var data = {
//    'PDF': strPDF,
//    'IMG': strIMG,
//    'FileName': 'ffffff',
//  };
//  mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
//    print("Store Successfully");
//  });
//}
////------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------------------------------------------------------------------
//Future getPdfAndUpload() async {
//  var rng = new Random();
//  String randomName = "";
//  for (var i = 0; i < 20; i++) {
//    print(rng.nextInt(100));
//    randomName += rng.nextInt(100).toString();
//  }
//  File file = await FilePicker.getFile(type: FileType.custom);
//  String fileName = '$randomName.pdf';
//  savePdf(file.readAsBytesSync(), fileName);
//}
//
//savePdf(List<int> asset, String name) async {
//  StorageReference reference = FirebaseStorage.instance.ref().child(name);
//  StorageUploadTask uploadTask = reference.putData(asset);
//  String url = await (await uploadTask.onComplete).ref.getDownloadURL();
//  documentFileUpload(url);
//}
//
//String CreateCryptoRandomString([int length = 32]) {
//  final Random _random = Random.secure();
//  var values = List<int>.generate(length, (i) => _random.nextInt(256));
//  return base64Url.encode(values);
//}
//
//void documentFileUpload(String strPDF, String strIMG) {
//  var data = {
//    'PDF': strPDF,
//    'IMG': strIMG,
//    'FileName': 'My new book',
//  };
//  mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
//    print("Store Successfully");
//  });
//}
//------------------------------------------------------------------------------------------------------------------------------------------------------------
