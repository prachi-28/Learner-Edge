import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learner_edge/models/call_data.dart';
import 'package:learner_edge/models/slot_data.dart';
import 'package:learner_edge/home/book_slot_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learner_edge/home/success_slot_book.dart';

class ReadSlotsClass
{

  ReadSlotsClass();



  StreamBuilder readAfternoonSlots(String email)
  {
    String docID = email;
    Stream<QuerySnapshot> _friendsStream =
    FirebaseFirestore.instance.collection('teachers').doc(docID).collection('afternoon_slots').snapshots();
    User user = FirebaseAuth.instance.currentUser;


    return StreamBuilder<QuerySnapshot>(
      stream: _friendsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Container(
          height: 200,
          width: 500,
          child: ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return Padding(
                padding: const EdgeInsets.only(top: 0),
                child: new ListTile(
                    // onTap: () {
                    //   _getEmail.setEmail(document.data()['femail']);
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => addTransactionFriend(email: document.data()['femail'])
                    //     ),
                    //   );
                    //
                    // },
                    title: new Text(document.id,
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  trailing: new IconButton(
                    icon: const Icon(Icons.add_call),
                    color: HexColor("#ffffff"),
                    tooltip: 'Book a slot',
                    onPressed: (){



                    },
                  ),

                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }


  StreamBuilder readMorningSlots(String email)
  {
    String docID = email;
    Stream<QuerySnapshot> _friendsStream =
    FirebaseFirestore.instance.collection('teachers').doc(docID).collection('morning_slots').snapshots();
    User user = FirebaseAuth.instance.currentUser;


    return StreamBuilder<QuerySnapshot>(
      stream: _friendsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Container(
          height: 200,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return new ListTile(

                  title: new Text(document.id,
                  style: TextStyle(
                    fontSize: 12
                  ),
                  ),
                  trailing: new IconButton(
                    icon: const Icon(Icons.add_call),
                    color: HexColor("#ffffff"),
                    tooltip: 'Book a slot',
                    onPressed: (){

                      final callData=CallData(
                        studentEmail: user.email,
                        teacherEmail: email

                      );

                      // :: TODO icon button ko grey out karna hai
                      // :: TODO Teacher view
                      // :: TODO mailer

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessSlotBook(
                              data: callData,
                            )
                        ),
                      );




                    },
                  ),

                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}