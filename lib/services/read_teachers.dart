import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learner_edge/models/user.dart';
import 'package:learner_edge/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';

class ReadUserClass
{
  ReadUserClass();

  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('teachers').snapshots();

  CollectionReference users = FirebaseFirestore.instance.collection('teachers');

  StreamBuilder readTeachers()
  {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Container(
          height: 500,
          width: 500,
          child: ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Text(document.data()['name']),
                subtitle: new Text(document.data()['email']),
                trailing: new Text('Test'),
                // subtitle: Align(
                //   alignment: Alignment.bottomLeft,
                //   child: new FlatButton(
                //     onPressed: () {
                //
                //     },
                //     // padding: EdgeInsets.all(20),
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                //
                //     child: Text(
                //       'Book',
                //       style: TextStyle(
                //         color: HexColor("#e16428"),
                //       ),
                //     ),
                //   ),
                // ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}