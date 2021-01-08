import 'package:LoginSample/models/RegisterStudent.dart';
import 'package:LoginSample/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  LocalUser _userFromFireBaseUser(User user) {
    return user != null ? LocalUser(uid: user.uid) : null;
  }

  Stream<LocalUser> get user {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }

  Future signInWithEmailAndPassword(String userID, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: userID + "@gmail.com", password: password);
      User user = result.user;
      return _userFromFireBaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future registerWithEmailAndPassword(
      RegisterStudent student, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: student.userName + "@gmail.com", password: student.password);
      firestoreInstance
          .collection("users")
          .doc(result.user.uid)
          .set({'grade': int.parse(student.registerGrade)});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<dynamic> getGrade(String userId) {
    return firestoreInstance.collection('users').doc(userId).snapshots();
  }
}
