import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ReadStudentsClass
{
  ReadStudentsClass();

  StreamBuilder readStudents()
  {

    User user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> _studentsStream =
    FirebaseFirestore.instance.collection('teachers').doc(user.email).collection('confirm_slots').snapshots();
    CollectionReference users = FirebaseFirestore.instance.collection('teachers').doc(user.email).collection('confirm_slots');

    return StreamBuilder<QuerySnapshot>(
      stream: _studentsStream,
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
                title: new Text(document.id),
                subtitle: new Text(document.data()['day']),
                trailing: new Text(document.data()['slot']),
              );
            }).toList(),
          ),
        );
      },
    );

  }


}