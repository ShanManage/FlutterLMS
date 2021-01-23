import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomSubjectCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/SubjectScreen.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectListScreen extends StatelessWidget {
  int grade;
  SubjectListScreen({@required this.grade});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  final AuthService _auth = AuthService();
  DatabaseService _ds = DatabaseService();
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

  @override
  Widget build(BuildContext context) {
    subjectStream = _ds.getSubjects(this.grade);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Container(
          child: Column(
            children: [
              CustomAppbar(
                title: "LMS",
                callbackTail: () async {
                  await _auth.signOut();
                },
                callbackHead: null,
              ),
              Container(
                padding: EdgeInsets.only(top: blockHeight),
                height: blockHeight * 80,
                child: StreamBuilder<QuerySnapshot>(
                  stream: subjectStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CustomLoading();
                    } else {
                      if (snapshot.hasData && snapshot.data.size != 0) {
                        return Container(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: loadSubjects(snapshot, context),
                          ),
                        );
                      } else {
                        return CustomNotificationCard(
                          title:
                              "Something went wrong.. Plese restart the app after few minutes",
                        );
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
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
