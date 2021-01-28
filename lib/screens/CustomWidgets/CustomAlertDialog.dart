import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAlertDialog extends StatelessWidget {
  String title, description;
  final VoidCallback callbackYes, callbackNo;

  CustomAlertDialog(
      {@required this.title,
      @required this.description,
      @required this.callbackYes,
      @required this.callbackNo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(title),
      elevation: 10.0,
      content: Text(description),
      actions: [
        FlatButton(
          child: Text("NO"),
          onPressed: () {
            callbackNo();
          },
        ),
        FlatButton(
          child: Text("YES"),
          onPressed: () {
            callbackYes();
          },
        ),
      ],
    );
  }
}
