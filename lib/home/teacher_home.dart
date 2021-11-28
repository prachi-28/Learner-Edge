import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learner_edge/services/auth.dart';
import 'package:learner_edge/services/read_students.dart';

class TeacherHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeacherHomeStateful();
  }
}

class TeacherHomeStateful extends StatefulWidget {
  @override
  _TeacherHomeStatefulState createState() => _TeacherHomeStatefulState();
}

class _TeacherHomeStatefulState extends State<TeacherHomeStateful> {
  final AuthService _auth = AuthService();
  ReadStudentsClass _readStudents=ReadStudentsClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:SingleChildScrollView
          (
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 70, left: 16, right: 16),
                child: Text(
                  'Confirmed Slots',
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
                child: _readStudents.readStudents(),
              ),


            ]),
          //),
        ));
  }
}

