import 'package:cloud_firestore/cloud_firestore.dart';

class LocalUser {
  final firestoreInstance = FirebaseFirestore.instance;

  final String uid;
  int grade;

  LocalUser({this.uid});
}
