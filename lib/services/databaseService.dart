import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  Stream<dynamic> getSubjects(int grade) {
    return firestoreInstance.collection(grade.toString()).snapshots();
  }
}
