import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learner_edge/services/read_teachers.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learner_edge/services/auth.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final AuthService _auth = AuthService();
  ReadUserClass _read = ReadUserClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color: Colors.red
      //child: Expanded(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 70, left: 16, right: 16),
              child: Text(
                'Book a slot!',
                style: TextStyle(
                  color: HexColor("#ffffff"),
                  fontSize: 35,
                ),
              ),
            ),

      FlatButton(
           onPressed: () {
             _auth.signOut();
           },
           // padding: EdgeInsets.all(20),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
           child: Text(
             'Logout',
             style: TextStyle(
               color: HexColor("#e16428"),
             ),
           ),
         ),


            Padding(
              padding: EdgeInsets.all(20.0),
              child: _read.readTeachers(),
            ),


          ]),
      //),
    );
  }
}












