import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomDropDownList.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:flutter/material.dart';

class AddDocumentScreen extends StatelessWidget {
  UploadDocument document = new UploadDocument();

  final titleController = TextEditingController();
  DatabaseService dbService = DatabaseService();

  onClickUpload() {
    document.title = titleController.text;
    document.docURL = "asdasd";
    document.thumbnailURL = "thumnail urk";

    try {
      dbService.insertDocument(document);
    } catch (e) {
      print("Add doc screen" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Center(
              child: Container(
            padding: EdgeInsets.all(10),
            child: CustomText(
              text: "AdminDashboard",
              color: Colors.black,
            ),
          )),
          Center(
              child: Container(
            padding: EdgeInsets.all(10),
            child: CustomDropDownList(
              list: _grades,
              lable: "grade",
              type: "ug",
              ud: document,
              fillColor: Colors.brown[50],
            ),
          )),
          Center(
              child: Container(
            padding: EdgeInsets.all(10),
            child: CustomDropDownList(
              list: _subjects,
              lable: "subject",
              type: "us",
              ud: document,
              fillColor: Colors.brown[50],
            ),
          )),
          Center(
              child: Container(
            padding: EdgeInsets.all(10),
            child: CustomDropDownList(
              list: _documentType,
              lable: "type",
              type: "ut",
              ud: document,
              fillColor: Colors.brown[50],
            ),
          )),
          CustomFormField(
            hintText: "title",
            isPass: false,
            fieldController: titleController,
            prefixIcon: Icons.keyboard,
            fillColor: Colors.blue[100],
          ),
          SizedBox(height: 20.0),
          CustomButton(
            title: "Upload",
            bgColor: Colors.blue[800],
            textColor: Colors.white,
            callback: () {
              onClickUpload();
            },
          )
        ]),
      ),
    );
  }

  List<DropdownMenuItem<String>> _grades = [
    DropdownMenuItem(
      child: new Text("grade 6"),
      value: "6",
    ),
    DropdownMenuItem(
      child: new Text("grade 7"),
      value: "7",
    ),
    DropdownMenuItem(
      child: new Text("grade 8"),
      value: "8",
    ),
    DropdownMenuItem(
      child: new Text("grade 9"),
      value: "9",
    ),
    DropdownMenuItem(
      child: new Text("grade 10"),
      value: "10",
    ),
    DropdownMenuItem(
      child: new Text("grade 11"),
      value: "11",
    ),
  ];

  List<DropdownMenuItem<String>> _subjects = [
    DropdownMenuItem(
      child: new Text("Mathematical"),
      value: "maths",
    ),
    DropdownMenuItem(
      child: new Text("Sscience"),
      value: "science",
    ),
    DropdownMenuItem(
      child: new Text("English"),
      value: "english",
    ),
    DropdownMenuItem(
      child: new Text("Sinhala"),
      value: "sinhala",
    ),
    DropdownMenuItem(
      child: new Text("History"),
      value: "history",
    ),
    DropdownMenuItem(
      child: new Text("Budhism"),
      value: "budhism",
    ),
  ];

  List<DropdownMenuItem<String>> _documentType = [
    DropdownMenuItem(
      child: new Text("pdf"),
      value: "pdf",
    ),
    DropdownMenuItem(
      child: new Text("video"),
      value: "video",
    ),
    DropdownMenuItem(
      child: new Text("lms"),
      value: "lms",
    ),
    DropdownMenuItem(
      child: new Text("audio"),
      value: "audio",
    ),
  ];
}
