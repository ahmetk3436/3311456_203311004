import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthh {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerFirebase(
      String email, String password, BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    if (auth.currentUser != null) {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
  }

  Future<void> updateFirestore(
      String name, String userGender, int height, int weight, int age) async {
    await _firestore.collection('Person').doc(auth.currentUser!.uid).set({
      'name': name,
      'userGender': userGender,
      'height': height,
      'weight': weight,
      'age': age
    }, SetOptions(merge: true));
  }
}
