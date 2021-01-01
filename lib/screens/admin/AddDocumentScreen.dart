import 'dart:io';
import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomDropDownList.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

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

  String fileType = '';
  File file;
  String fileName = '';
  String operationText = '';
  bool isUploaded = true;
  // String result = '';

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

  Future pickFile() async {
    // try {
    //   result = await FilePicker.platform.pickFiles(type: FileType.any);
    //   if (result != null) {
    //     PlatformFile pFile = result.files.first;

    //     print(pFile.name);
    //     print(pFile.bytes);
    //     print(pFile.size);
    //     print(pFile.extension);
    //     print(pFile.path);

    //     // dbService.uploadFile(file, filename, filePath);
    //   } else {
    //     // User canceled the picker
    //   }

    // if (fileType == 'image') {
    //   file = await FilePicker.getFile(type: FileType.IMAGE);
    //   setState(() {
    //     fileName = p.basename(file.path);
    //   });
    //   print(fileName);
    //   _uploadFile(file, fileName);
    // }
    // if (fileType == 'audio') {
    //   file = await FilePicker.getFile(type: FileType.AUDIO);
    //   fileName = p.basename(file.path);
    //   setState(() {
    //     fileName = p.basename(file.path);
    //   });
    //   print(fileName);
    //   _uploadFile(file, fileName);
    // }
    // if (fileType == 'video') {
    //   file = await FilePicker.getFile(type: FileType.VIDEO);
    //   fileName = p.basename(file.path);
    //   setState(() {
    //     fileName = p.basename(file.path);
    //   });
    //   print(fileName);
    //   _uploadFile(file, fileName);
    // }
    // if (fileType == 'pdf') {
    //   file = await FilePicker.getFile(
    //       type: FileType.CUSTOM, fileExtension: 'pdf');
    //   fileName = p.basename(file.path);
    //   setState(() {
    //     fileName = p.basename(file.path);
    //   });
    //   print(fileName);
    //   _uploadFile(file, fileName);
    // }
    // if (fileType == 'others') {
    //   file = await FilePicker.getFile(type: FileType.ANY);
    //   fileName = p.basename(file.path);
    //   setState(() {
    //     fileName = p.basename(file.path);
    //   });
    //   print(fileName);
    //   _uploadFile(file, fileName);
    // }

    // } on PlatformException catch (e) {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: Text('Sorry...'),
    //           content: Text('Unsupported exception: $e'),
    //           actions: <Widget>[
    //             FlatButton(
    //               child: Text('OK'),
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               },
    //             )
    //           ],
    //         );
    //       });
    // }
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
    print("add document screen render");
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
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: CustomDropDownList(
                list: _grades,
                lable: "grade",
                type: "ug",
                ud: document,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: CustomDropDownList(
                list: _subjects,
                lable: "subject",
                type: "us",
                ud: document,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: CustomDropDownList(
                list: _documentType,
                lable: "type",
                type: "ut",
                ud: document,
              ),
            ),
          ),
          CustomFormField(
            hintText: "title",
            isPass: false,
            fieldController: titleController,
            prefixIcon: Icons.keyboard,
            fillColor: Colors.blue[100],
          ),
          SizedBox(height: 20.0),
          CustomButton(
            title: "Pick a file",
            bgColor: Colors.green[800],
            textColor: Colors.white,
            width: blockWidth * 40,
            height: blockHeight * 5,
            fontSize: blockHeight * 2.5,
            callback: () {
              pickFile();
            },
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
}
