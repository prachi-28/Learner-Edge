import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learner_edge/services/auth.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,

      appBar: AppBar(
        //;backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        title: Text('Welcome Teacher'),


      ),
      body: FlatButton(
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



    );
  }
}

