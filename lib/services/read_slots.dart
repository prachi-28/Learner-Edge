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
    final String _afternoonSlot="12-1 PM";
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
          height: 250,
          width: 500,
          child: ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              bool check=true;
              print(document.data()['count']);
              if(document.data()['count']==0) {
                check=false;
              }

              return Padding(
                padding: const EdgeInsets.only(top: 0),
                child: new ListTile(

                    title: check==true?
                    Text(document.id,
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ) :Text('${document.id}: This slot is booked',
                      style: TextStyle(
                        color: HexColor("#75E6DA"),
                        fontSize: 12
                    ),
                    ),
                  trailing: check==true?
                  IconButton(
                    icon: const Icon(Icons.add_call),
                    color: HexColor("#ffffff"),
                    tooltip: 'Book a slot',
                    onPressed: (){


                      final callData=CallData(
                          studentEmail: user.email,
                          teacherEmail: email,
                          day: document.id,
                          slot: _afternoonSlot
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessSlotBook(
                              data: callData,
                            )
                        ),
                      );




                    },
                  )
                      :IconButton(
                    onPressed: (){null;},
                    icon: const Icon(Icons.add_call),
                    color: HexColor("#75E6DA"),
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
    final String _morningSlot="11-12 PM";
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
          height: 250,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                bool check=true;
                print(document.data()['count']);
                if(document.data()['count']==0) {
                  check=false;
                }

                return new ListTile(

                  title: check==true?
                  Text(document.id,
                    style: TextStyle(
                        fontSize: 12
                    ),
                  ) :Text('${document.id}: This slot is booked',
                    style: TextStyle(
                        color: HexColor("#75E6DA"),
                        fontSize: 12
                    ),

                  ),
                  trailing: check==true?
                  IconButton(
                    icon: const Icon(Icons.add_call),
                    color: HexColor("#ffffff"),
                    tooltip: 'Book a slot',
                    onPressed: (){


                      final callData=CallData(
                        studentEmail: user.email,
                        teacherEmail: email,
                        day: document.id,
                        slot: _morningSlot
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessSlotBook(
                              data: callData,
                            )
                        ),
                      );




                    },
                  )
                  :IconButton(
                      onPressed: (){null;},
                      icon: const Icon(Icons.add_call),
                    color: HexColor("#75E6DA"),
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