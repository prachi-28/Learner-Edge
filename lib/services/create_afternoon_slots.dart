import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learner_edge/models/user.dart';
import 'package:learner_edge/services/auth.dart';

class CreateAfternoonSlotsService {
  //called on registration to set up new document under user collection
  //document ID of new document is the email ID entered on Registration -- guaranteed unique value
  CreateAfternoonSlotsService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addAfternoonSlot(String email, String day) async {
    // creates new user with document ID = email ID
    await _firestore
        .collection('teachers')
        .doc(email)
        .collection('afternoon_slots')
        .doc(day)
        .set({
      'slot': true,
      'count': 0

    })
        .then((value) {
      print("Added afternoon slot");

    })
        .catchError((error) => print("Failed to add afternoon slot: $error"));
  }
}
