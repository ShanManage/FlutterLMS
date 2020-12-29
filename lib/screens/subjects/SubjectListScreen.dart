import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/SubjectScreen.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubjectListScreen extends StatelessWidget {
  int grade;
  SubjectListScreen({@required this.grade});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  DatabaseService _ds = DatabaseService();
  Stream subjectStream;

  Subject subject;

  @override
  Widget build(BuildContext context) {
    subjectStream = _ds.getSubjects(this.grade);
    return StreamBuilder<QuerySnapshot>(
      stream: subjectStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // TODO : meka hadapan
          return CustomLoading();
        } else {
          return Container(
            padding: EdgeInsets.symmetric(vertical: blockHeight * 2.5),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: loadSubjects(snapshot, context),
            ),
          );
        }
      },
    );
  }

  loadSubjects(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map(
          (doc) => CustomCard(
            title: doc["subject"],
            callback: () {
              subject = new Subject();
              subject.subjectName = doc["subject"];
              subject.pdfList = (doc["pdf"] != null) ? doc["pdf"] : null;
              subject.videoList = (doc["video"] != null) ? doc["video"] : null;
              subject.audioList = (doc["audio"] != null) ? doc["audio"] : null;
              subject.lmsList = (doc["lms"] != null) ? doc["lms"] : null;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubjectScreen(subject: subject),
                ),
              );
            },
          ),
        )
        .toList();
  }
}
