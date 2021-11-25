import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learner_edge/models/user.dart';
import 'package:learner_edge/services/auth.dart';

class CreateTeacherService {
  //called on registration to set up new document under user collection
  //document ID of new document is the email ID entered on Registration -- guaranteed unique value
  CreateTeacherService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addTeacher(String email, String name, List<String> afternoonSlots, List<String> morningSlots) async {
    // creates new user with document ID = email ID
    await _firestore
        .collection('teachers')
        .doc(email)
        .set({
      'email': email,
      'name': name,
      'afternoonSlots': afternoonSlots,
      'morningSlots':morningSlots,
      'userType': 1// John Doe

    })
        .then((value) {
      print("Added Teacher");
      //TODO: find more efficient way to send email ID
    })
        .catchError((error) => print("Failed to add student: $error"));
  }
}
