import 'package:LoginSample/models/UploadDocument.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  Stream<dynamic> getSubjects(int grade) {
    return firestoreInstance.collection(grade.toString()).snapshots();
  }

  insertDocument(UploadDocument ud) async {
    try {
      await firestoreInstance
          .collection(ud.docGrade.toString())
          .doc(ud.docSubject.toString())
          .set({
        'subject': ud.docSubject.toString(),
        ud.docType.toString(): FieldValue.arrayUnion([
          {"title": ud.title, "url": ud.docURL, "thumbnail": ud.thumbnailURL}
        ])
      }, SetOptions(merge: true));
      // );
    } catch (e) {
      print("database service" + e.toString());
    }
  }
}
