import 'package:LoginSample/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  // String _grade;

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
      // DocumentSnapshot _doc =
      //     await _firestore.collection('users').doc(user.uid).get();
      // Map<String, dynamic> _data = _doc.data();
      // _grade = _data["grade"];
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      // _firestore.collection("users").doc(user.uid).set({grade: grade});
      // _grade = grade;
      return _userFromFireBaseUser(user);
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
