import 'package:LoginSample/screens/CustomWidgets/CustomGradeCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:LoginSample/screens/admin/studentsListScreen.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// pake wedane wenne hutta
class GradeListScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  DatabaseService _ds = DatabaseService();
  Stream gradeStream;

  gradeCallBack(int grade, String strGrade) {
    Get.to(StudentsListScreen(
      grade: grade,
      strGrade: strGrade,
    ));
  }

  @override
  Widget build(BuildContext context) {
    gradeStream = _ds.getGrades();
    return StreamBuilder<QuerySnapshot>(
      stream: gradeStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoading();
        } else {
          if (snapshot.hasData && snapshot.data.size != 0) {
            return Column(
              children: [
                Container(
                  height: blockHeight * 69,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: loadGrades(snapshot, context),
                  ),
                ),
              ],
            );
          } else {
            return CustomNotificationCard(
              title:
                  "Something went wrong.. Plese restart the app after few minutes",
            );
          }
        }
      },
    );
  }

  loadGrades(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map(
          (doc) => CustomGradeCard(
            title: doc['name'].toString(),
            height: blockHeight * 10.3,
            callback: () {
              gradeCallBack(doc['intName'], doc['name']);
            },
          ),
        )
        .toList();
  }
}
