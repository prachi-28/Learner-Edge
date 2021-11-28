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

class DeleteSlot {
  DeleteSlot();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;

  DeleteSlotStudent(String teacherEmail, String slot, String day)
  {
    String slotCollection="";
    if(slot=="11-12 PM") {
      slotCollection="morning_slots";
    }
    else {
      slotCollection="afternoon_slots";
    }
    print(teacherEmail);
    print(slotCollection);
    print(day);
    String studentEmail=user.email;
    String docID = teacherEmail;
    _firestore
        .collection('teachers')
        .doc(docID)
        .collection(slotCollection)
        .doc(day)
        .update({'count':0});
    print("Update successful");

    }
  }
