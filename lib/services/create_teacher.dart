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

  Future addTeacher(String email, String name, String qualification, String slots) async {
    // creates new user with document ID = email ID
    await _firestore
        .collection('students')
        .doc(email)
        .set({
      'email': email,
      'name': name,
      'qualification': qualification,
      'slots': slots,
      'teacher': 1// John Doe
    })
        .then((value) {
      print("Added Student");
      //TODO: find more efficient way to send email ID
    })
        .catchError((error) => print("Failed to add student: $error"));
  }
}
