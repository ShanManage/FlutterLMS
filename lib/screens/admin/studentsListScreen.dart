import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomStudentsCard.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentsListScreen extends StatefulWidget {
  int grade;
  String strGrade;
  Stream students;
  DatabaseService _ds = DatabaseService();

  final titleController = TextEditingController();

  StudentsListScreen({@required this.grade, @required this.strGrade});

  @override
  _StudentsListScreenState createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  DatabaseService dbService = DatabaseService();

  onToggle(String id, bool isEnable) {
    dbService.changeAccess(id, isEnable);
  }

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    this.widget.students = this.widget._ds.getStudents(this.widget.grade);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Column(
          children: [
            CustomAppbar(
              title: this.widget.strGrade,
              callbackTail: () async {
                await _auth.signOut();
              },
              callbackHead: () {
                Get.back();
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: this.widget.students,
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
                              vertical: blockHeight * 2),
                          margin: EdgeInsets.only(top: blockHeight),
                          child: CustomFormField(
                            hintText: "search",
                            isPass: false,
                            fieldController: this.widget.titleController,
                            prefixIcon: Icons.search,
                            fillColor: Colors.blueGrey[100],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: blockHeight * 69,
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
            height: blockHeight * 9,
            toggleValue: doc['isEnable'],
            callback: () {
              onToggle(doc['id'], !doc['isEnable']);
            },
          ),
        )
        .toList();
  }
}
