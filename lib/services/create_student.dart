import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learner_edge/models/user.dart';
import 'package:learner_edge/services/auth.dart';

class CreateStudentService {
  //called on registration to set up new document under user collection
  //document ID of new document is the email ID entered on Registration -- guaranteed unique value
  CreateStudentService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addStudent(String email, String name, String course) async {
    // creates new user with document ID = email ID
    await _firestore
        .collection('students')
        .doc(email)
        .set({
      'email': email,
      'name': name,
      'course': course,
      'userType': 0   // Student
    })
        .then((value) {
      print("Added Student");
      //TODO: find more efficient way to send email ID
    })
        .catchError((error) => print("Failed to add student: $error"));
  }
}
