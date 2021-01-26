import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomDropDownList.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/shared/const.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:flutter/material.dart';

class AddSubjectScreen extends StatefulWidget {
  @override
  _AddSubjectScreenState createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  final subjectController = TextEditingController();
  UploadDocument document = new UploadDocument();
  DatabaseService dbService = DatabaseService();
  Const constList = Const();
  bool isUpload = true;

  onClickUpload() async {
    setState(() {
      isUpload = false;
    });

    document.docSubject = subjectController.text;

    if (document.docGrade != null && document.docSubject.isNotEmpty) {
      try {
        dbService.insertSubject(document);
      } catch (e) {}
    }

    setState(() {
      subjectController.text = '';
      isUpload = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
      child: Column(children: [
        SizedBox(height: blockHeight * 2.5),
        CustomDropDownList(
          list: constList.grades,
          prefixIcon: Icons.school,
          lable: "grade",
          type: "ug",
          ud: document,
          fillColor: Colors.deepPurple[100],
        ),
        SizedBox(height: blockHeight * 2.5),
        CustomFormField(
          hintText: "subject",
          isPass: false,
          fieldController: subjectController,
          prefixIcon: Icons.keyboard,
          fillColor: Colors.deepPurple[100],
        ),
        SizedBox(height: 20.0),
        (isUpload == true)
            ? CustomButton(
                title: "Upload Document",
                bgColor: Colors.deepPurple[800],
                textColor: Colors.white,
                callback: () {
                  onClickUpload();
                },
              )
            : CustomLoading(),
      ]),
    );
  }
}
