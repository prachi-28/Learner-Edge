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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 70, left: 16, right: 16),
                    child: Text(
                      'Confirmed Slots',
                      style: TextStyle(
                        color: HexColor("#ffffff"),
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 50, right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        _auth.signOut();
                      },
                      // padding: EdgeInsets.all(20),
                      child: Text(
                        'Logout',
                      ),
                    ),
                  ),
                ],
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

