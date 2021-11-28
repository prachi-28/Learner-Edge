import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConfirmSlot {
  ConfirmSlot();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;

  AddSlotStudent(String teacherEmail, String day, String slot)
  {
    String studentEmail=user.email;
    String docID = teacherEmail;
    _firestore
        .collection('teachers')
        .doc(teacherEmail)
        .collection('confirm_slots')
        .doc(studentEmail)
        .set({
      'slot': slot,
      'day': day

    })
        .then((value) {
      print("Conirm slot added");
      //TODO: find more efficient way to send email ID
    })
        .catchError((error) => print("Failed to add confirm slot: $error"));
  }
}