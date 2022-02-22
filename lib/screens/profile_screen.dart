import 'package:flutter/material.dart';
import 'package:u_note/components/editProfile.dart';
import 'package:u_note/components/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  final String loggedInEmail;
  ProfileScreen({this.loggedInEmail});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: Color(0xFF4267B2),
          child: EditProfile(
            loggedInEmail: widget.loggedInEmail,
          )),
    );
  }
}
