import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomDropDownList.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/authenticate/sign_up.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  UploadDocument document = new UploadDocument();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ),
        )),
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "title"),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "thumbnail"),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "document"),
            ),
          ),
        ),
        Container(
          child: Row(children: [
            RaisedButton(
              padding: EdgeInsets.all(10),
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Upload'),
              onPressed: null,
            ),
            RaisedButton(
              padding: EdgeInsets.all(10),
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('add new'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
            ),
          ]),
        )
      ]),
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
}