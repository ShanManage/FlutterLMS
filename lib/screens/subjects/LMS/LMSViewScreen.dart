import 'package:LoginSample/models/UploadDocument.dart';
import 'package:flutter/material.dart';

class LMSViewScreen extends StatefulWidget {
  UploadDocument ud;
  // LMSViewScreen({@required this.ud});
  @override
  _LMSViewScreenState createState() => _LMSViewScreenState();
}

class _LMSViewScreenState extends State<LMSViewScreen> {
  @override
  Widget build(BuildContext context) {
    // print(this.widget.ud.title);
    return Container(
      child: Text("this.widget.ud.title"),
    );
  }
}
