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












// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:learner_edge/services/auth.dart';
//
// class StudentHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StudentHomeStateful();
//   }
// }
//
// class StudentHomeStateful extends StatefulWidget {
//   @override
//   _StudentHomeStatefulState createState() => _StudentHomeStatefulState();
// }
//
// class _StudentHomeStatefulState extends State<StudentHomeStateful> {
//   final AuthService _auth = AuthService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.grey,
//
//       appBar: AppBar(
//         //;backgroundColor: Colors.blueGrey,
//         elevation: 0.0,
//         title: Text('Welcome Student'),
//
//
//       ),
//       body: FlatButton(
//         onPressed: () {
//           _auth.signOut();
//         },
//         // padding: EdgeInsets.all(20),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         child: Text(
//           'Logout',
//           style: TextStyle(
//             color: HexColor("#e16428"),
//           ),
//         ),
//       ),
//
//
//
//     );
//   }
// }
//
