import 'package:LoginSample/models/RegisterStudent.dart';
import 'package:LoginSample/models/UploadDocument.dart';
import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  List<DropdownMenuItem<String>> list;
  RegisterStudent rs;
  UploadDocument ud;
  String lable;
  String type;
  Color fillColor;
  CustomDropDownList({
    @required this.list,
    this.rs,
    this.ud,
    this.lable,
    this.type,
    this.fillColor,
  });

  @override
  _CustomDropDownListState createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  // ignore: missing_return
  String getType() {
    if (this.widget.type == "rs") {
      return this.widget.rs.registerGrade;
    } else if (this.widget.type == "ug") {
      return this.widget.ud.docGrade;
    } else if (this.widget.type == "us") {
      return this.widget.ud.docSubject;
    } else if (this.widget.type == "ut") {
      return this.widget.ud.docType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
        labelStyle: TextStyle(),
        // labelText: this.widget.lable,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(50.0),
        ),
        filled: true,
        fillColor: (this.widget.fillColor == null)
            ? Colors.green[50]
            : this.widget.fillColor,
        border: InputBorder.none,
      ),
      items: this.widget.list,
      value: getType(),
      onChanged: (value) {
        setState(() {
          if (this.widget.type == "rs") {
            this.widget.rs.registerGrade = value;
          } else if (this.widget.type == "ug") {
            this.widget.ud.docGrade = value;
          } else if (this.widget.type == "us") {
            this.widget.ud.docSubject = value;
          } else if (this.widget.type == "ut") {
            this.widget.ud.docType = value;
          }
        });
      },
    );
  }
}
