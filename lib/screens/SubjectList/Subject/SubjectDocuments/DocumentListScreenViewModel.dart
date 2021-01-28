import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class DocumentListScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();

  UploadDocument ud;
  VoidCallback callback;

  documentViewCallback(var doc) {
    ud.docType = ud.docURL = doc["url"];
    ud.title = doc["title"];
    ud.thumbnailURL = doc["thumbnail"];
    callback();
  }
}
