import 'dart:io';
import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomDropDownList.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;

class AddDocumentScreen extends StatefulWidget {
  @override
  _AddDocumentScreenState createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  UploadDocument document = new UploadDocument();

  final titleController = TextEditingController();
  DatabaseService dbService = DatabaseService();

  File docfile, imagefile;
  String docfileName = "",
      imagefileName = "",
      docUploadpath = "",
      imageUploadpath = "";
  bool isUpload = true;
  bool isError = false;
  bool isDocument = true;

  onClickUpload() async {
    setState(() {
      isUpload = false;
    });
    document.title = titleController.text;

    if (document.docGrade != null &&
        document.docSubject != null &&
        document.docType != null &&
        document.title != null) {
      if (imagefile != null) {
        document.thumbnailURL = await dbService.uploadFile(
            imagefile, imagefileName, imageUploadpath);
      } else {
        document.thumbnailURL = null;
      }

      if (docfile != null) {
        document.docURL =
            await dbService.uploadFile(docfile, docfileName, docUploadpath);
      }
      // else {
      // show error message to upload file befor send data
      // }
      if (document.docURL != null) {
        try {
          dbService.insertDocument(document);
          isError = false;
          print("DOCUMENT URL : " + document.docURL);
        } catch (e) {
          isError = true;
          print("ERROR ON ADD DOCUMENT SCREEN : " + e.toString());
        }
        if (isError = false) {
          document = null;
        }
        setState(() {
          titleController.text = '';
          isUpload = true;
        });
      }
    }
  }

  Future pickFile(bool isDocument) async {
    if (document.docGrade != null &&
        document.docSubject != null &&
        document.docType != null &&
        titleController.text != null) {
      try {
        if (isDocument) {
          if (document.docType == "audio") {
            docfile = await FilePicker.getFile(type: FileType.AUDIO);
          }

          if (document.docType == "video")
            docfile = await FilePicker.getFile(type: FileType.VIDEO);

          if (document.docType == "pdf" || document.docType == "lms")
            docfile = await FilePicker.getFile(
                type: FileType.CUSTOM, fileExtension: 'pdf');

          docfileName = path.basename(docfile.path);
          print("FILENAME : " + docfileName);
          docUploadpath = document.docGrade.toString() +
              "/" +
              document.docSubject.toString() +
              "/" +
              document.docType.toString() +
              "/" +
              document.title.toString() +
              "/" +
              docfileName;
        } else {
          imagefile = await FilePicker.getFile(type: FileType.IMAGE);

          imagefileName = path.basename(imagefile.path);
          print("FILENAME : " + docfileName);
          imageUploadpath = document.docGrade.toString() +
              "/" +
              document.docSubject.toString() +
              "/" +
              document.docType.toString() +
              "/" +
              document.title.toString() +
              "/" +
              imagefileName;
        }
      } on PlatformException catch (e) {
        print("ERROR WHILE PICKING DOCUMENT : " + e.toString());
      }
    }
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
      child: new Text("Science"),
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
    DropdownMenuItem(
      child: new Text("ICT"),
      value: "ict",
    ),
    DropdownMenuItem(
      child: new Text("Dancing"),
      value: "dancing",
    ),
    DropdownMenuItem(
      child: new Text("Art"),
      value: "art",
    ),
    DropdownMenuItem(
      child: new Text("Drama"),
      value: "drama",
    ),
    DropdownMenuItem(
      child: new Text("Geography"),
      value: "geography",
    ),
    DropdownMenuItem(
      child: new Text("Tamil"),
      value: "tamil",
    ),
    DropdownMenuItem(
      child: new Text("Health"),
      value: "health",
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        child: Column(children: [
          SizedBox(height: blockHeight * 2.5),
          CustomDropDownList(
            list: _grades,
            prefixIcon: Icons.school,
            lable: "grade",
            type: "ug",
            ud: document,
            fillColor: Colors.deepPurple[100],
          ),
          SizedBox(height: blockHeight * 2.5),
          CustomDropDownList(
            list: _subjects,
            prefixIcon: Icons.auto_stories,
            lable: "subject",
            type: "us",
            ud: document,
            fillColor: Colors.deepPurple[100],
          ),
          SizedBox(height: blockHeight * 2.5),
          CustomDropDownList(
            list: _documentType,
            prefixIcon: Icons.description,
            lable: "type",
            type: "ut",
            ud: document,
            fillColor: Colors.deepPurple[100],
          ),
          SizedBox(height: blockHeight * 2.5),
          CustomFormField(
            hintText: "title",
            isPass: false,
            fieldController: titleController,
            prefixIcon: Icons.keyboard,
            fillColor: Colors.deepPurple[100],
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: "Pick a document",
                  bgColor: Colors.green[800],
                  textColor: Colors.white,
                  height: blockHeight * 4,
                  fontSize: blockHeight * 2,
                  callback: () {
                    pickFile(isDocument);
                  },
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: CustomButton(
                  title: "Pick a thumbnail",
                  bgColor: Colors.green[800],
                  textColor: Colors.white,
                  height: blockHeight * 4,
                  fontSize: blockHeight * 2,
                  callback: () {
                    pickFile(!isDocument);
                  },
                ),
              ),
            ],
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
      ),
    );
  }
}
