import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:LoginSample/screens/admin/CustomWidgets/CustomAdminAppbar.dart';
import 'package:LoginSample/screens/admin/CustomWidgets/CustomStudentsCard.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class StudentsListScreen extends StatefulWidget {
  int grade;
  StudentsListScreen({@required this.grade});

  @override
  _StudentsListScreenState createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  DatabaseService _ds = DatabaseService();

  final titleController = TextEditingController();
  Stream students;

  onToggle(String id, bool isEnable) {
    _ds.changeAccess(id, isEnable);
  }

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    students = _ds.getStudents(this.widget.grade);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Column(
          children: [
            CustomAdminAppbar(
              title: "Grade " + this.widget.grade.toString(),
              callbackTail: () async {
                await _auth.signOut();
              },
              callbackHead: () {
                Get.back();
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: students,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CustomLoading();
                } else {
                  if (snapshot.hasData && snapshot.data.size != 0) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: blockWidth * 3,
                            vertical: blockHeight * 1.5,
                          ),
                          margin: EdgeInsets.only(top: blockHeight),
                          child: CustomFormField(
                            hintText: "search",
                            isPass: false,
                            fieldController: titleController,
                            prefixIcon: Icons.search,
                            fillColor: Colors.blueGrey[100],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: blockHeight * 68,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: loadStudents(snapshot, context),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return CustomNotificationCard(
                      title: "No Students registered for this grade",
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  loadStudents(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    return snapshot.data.docs
        .map(
          (doc) => CustomStudentsCard(
            title: doc['userName'],
            toggleValue: doc['isEnable'],
            callback: () {
              onToggle(doc['id'], !doc['isEnable']);
            },
          ),
        )
        .toList();
  }
}
