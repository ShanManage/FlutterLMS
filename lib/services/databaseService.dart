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
    } catch (e) {
      print("DATABSE SERVICE : " + e.toString());
    }
  }

  Future<String> uploadFile(File file, String filename, String filePath) async {
    StorageReference storageReference = storageInstance.ref();
    StorageUploadTask uploadTask;
    try {
      uploadTask = storageReference.child(filePath).putFile(file);
    } catch (e) {
      print("ERROR WHILE UPLOADING DOCUMENT : " + e.toString());
    }

    StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
    String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }
}
