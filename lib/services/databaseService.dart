import 'dart:io';

import 'package:LoginSample/models/UploadDocument.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final storageInstance = FirebaseStorage.instance;

  Stream<dynamic> getSubjects(int grade) {
    Stream<QuerySnapshot> snapshot;
    try {
      snapshot = firestoreInstance.collection(grade.toString()).snapshots();
    } catch (e) {
      print(" ERROR WHILE GETTING DATA : " + e.toString());
      print(" ERROR ON GRADE : " + grade.toString());
    }

    return snapshot;
  }

  Stream<dynamic> getGrades() {
    Stream<QuerySnapshot> snapshot;
    try {
      snapshot = firestoreInstance.collection('grades').snapshots();
    } catch (e) {
      print(" ERROR WHILE GETTING DATA : " + e.toString());
    }

    return snapshot;
  }

  Stream<dynamic> getStudents(int grade) {
    Stream<QuerySnapshot> snapshot;
    try {
      snapshot = firestoreInstance.collection('users').where("grade", isEqualTo: grade).snapshots();
    } catch (e) {
      print(" ERROR WHILE GETTING DATA : " + e.toString());
    }

    return snapshot;
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
    } catch (e) {
      print("ERROR WHILE UPLOADING DATA : " + e.toString());
      print("DOCUMENT : " + ud.toString());
    }
  }

  insertSubject(UploadDocument ud) async{
    List empty = List.empty();
    try{
      await firestoreInstance.collection(ud.docGrade.toString()).doc(ud.docSubject.toString()).set({
        'audio' : empty,
        'video' : empty,
        'pdf' : empty,
        'lms' : empty,
        'subject' : ud.docSubject.toString(),
      });
    } catch(e) {}
  }

  changeAccess(String id, bool isEnable) async {
    try{
      await firestoreInstance.collection('users').doc(id).update({
        'isEnable' : isEnable,
      });
    } catch(e){

    }
  }

  Future<String> uploadFile(File file, String filename, String filePath) async {
    StorageReference storageReference = storageInstance.ref();
    StorageUploadTask uploadTask;
    String url;
    try {
      uploadTask = storageReference.child(filePath).putFile(file);
      StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
      url = await downloadUrl.ref.getDownloadURL();
    } catch (e) {
      print("ERROR WHILE UPLOADING DOCUMENT : " + e.toString());
      print("DOCUMENT : " + filename);
    }

    return url;
  }
}
