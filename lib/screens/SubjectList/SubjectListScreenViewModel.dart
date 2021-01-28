import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomSubjectCard.dart';
import 'package:LoginSample/screens/SubjectList/Subject/SubjectScreenView.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectListScreenViewModel extends ChangeNotifier {
  double blockHeight = SizeConfig.safeBlockVertical;

  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();

  Stream subjectStream;

  Subject subject;

  subjectCallBack(QueryDocumentSnapshot doc) {
    subject = new Subject();
    subject.subjectName = doc["subject"];
    subject.pdfList = (doc["pdf"] != null) ? doc["pdf"] : null;
    subject.videoList = (doc["video"] != null) ? doc["video"] : null;
    subject.audioList = (doc["audio"] != null) ? doc["audio"] : null;
    subject.lmsList = (doc["lms"] != null) ? doc["lms"] : null;
    Get.to(SubjectScreen(subject: subject));
  }

  getDataStream(int grade) {
    subjectStream = databaseService.getSubjects(grade);
    return subjectStream;
  }

  loadSubjects(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map(
          (doc) => CustomSubjectCard(
            title: doc["subject"],
            height: blockHeight * 12.5,
            callback: () {
              subjectCallBack(doc);
            },
          ),
        )
        .toList();
  }
}
