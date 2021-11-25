// if user is logged in, show the home page
// else show login page

import 'package:flutter/material.dart';
import 'package:learner_edge/authentication/authenticate.dart';
import 'package:learner_edge/authentication/register.dart';
import 'package:learner_edge/home/home.dart';
import 'package:learner_edge/home/student_home.dart';
import 'package:learner_edge/home/teacher_home.dart';
import 'package:learner_edge/models/user.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> callAsyncFetch() async {
  bool isTeacher=true;
  String currentUserEmail = FirebaseAuth.instance.currentUser.email;
  print(currentUserEmail);

      await FirebaseFirestore.instance
      .collection('students')
      .doc(currentUserEmail)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      print('Document exists on the database');
      isTeacher=false;
    }
    else {
      print('Document doesnt exist');
      isTeacher=true;
    }
  });
      print(isTeacher);
      return isTeacher;
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<myUser>(context);

    if (user == null) {
      return Authenticate();
    }
    else {
      return FutureBuilder<bool>(
          future: callAsyncFetch(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot)
              {
                print("This is snapshot");
                print(snapshot);
                if(snapshot.data==true) {
                  return TeacherHome();
                }
                else
                  {
                    return StudentHome();
                  }


              }
      );


      // String currentUserEmail = FirebaseAuth.instance.currentUser.email;
      // print(currentUserEmail);
      //
      //     FirebaseFirestore.instance
      //     .collection('students')
      //     .doc(currentUserEmail)
      //     .get()
      //     .then((DocumentSnapshot documentSnapshot) {
      //   if (documentSnapshot.exists) {
      //     print('Document exists on the database');
      //     isTeacher=false;
      //
      //   }
      //   else {
      //     print('Document doesnt exist');
      //
      //   }
      // });
      //
      // if(isTeacher)
      // {
      //   return TeacherHome();
      // }
      // else
      // {
      //   return StudentHome();
      // }

    }
  }
  }



// class Wrapper extends StatefulWidget {
//   @override
//
//   _WrapperState createState() => _WrapperState();
// }
//
// class _WrapperState extends State<Wrapper> {
//
//
//   Widget build(BuildContext context) {
//     @override
//     // isTeacher is true if the current user is a teacher
//     // isTeacher is false if the current user is a student
//     bool isTeacher=true;
//     final user = Provider.of<myUser>(context);
//
//     if (user == null) {
//       return Authenticate();
//     }
//     else {
//
//       String currentUserEmail = FirebaseAuth.instance.currentUser.email;
//       print(currentUserEmail);
//
//        FirebaseFirestore.instance
//           .collection('students')
//           .doc(currentUserEmail)
//           .get()
//           .then((DocumentSnapshot documentSnapshot) {
//         if (documentSnapshot.exists) {
//           print('Document exists on the database');
//           isTeacher=false;
//
//         }
//         else {
//           print('Document doesnt exist');
//
//         }
//       });
//
//
//
//       if(isTeacher)
//         {
//           return TeacherHome();
//         }
//       else
//         {
//           return StudentHome();
//         }
//
//     }
//   }
// }
//
