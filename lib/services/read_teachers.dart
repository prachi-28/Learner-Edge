import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learner_edge/models/slot_data.dart';
import 'package:learner_edge/home/book_slot_page.dart';

class ReadUserClass
{
  ReadUserClass();

  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('teachers').snapshots();
  //final slotData=SlotData()

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
                trailing: new IconButton(
                  icon: const Icon(Icons.group_add_rounded),
                  color: HexColor("#ffffff"),
                  tooltip: 'Book a slot',
                  onPressed: (){

                    final slotData=SlotData(
                      name: document.data()['name'],
                      email: document.data()['email'],
                      // afternoonSlot: document.data()['afternoonSlots'],
                      // morningSlot: document.data()['morningSlots']

                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookSlotPage(
                          data: slotData,
                        )
                      ),
                    );


                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}