import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class CustomStudentsCard extends StatefulWidget {
  String title;
  final VoidCallback callback;
  bool toggleValue;

  CustomStudentsCard({
    @required this.title,
    @required this.callback,
    @required this.toggleValue,
  });

  @override
  _CustomStudentsCardState createState() => _CustomStudentsCardState();
}

class _CustomStudentsCardState extends State<CustomStudentsCard> {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: blockWidth * 12.5),
          height: blockHeight * 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomText(
                  text: this.widget.title,
                  color: Colors.deepPurple[500],
                  size: blockHeight * 2.5,
                  weight: FontWeight.w400,
                ),
              ),
              FlutterSwitch(
                width: blockWidth * 10,
                height: blockHeight * 2.5,
                toggleSize: blockHeight * 1.5,
                activeColor: Colors.deepPurple[400],
                value: this.widget.toggleValue,
                onToggle: (val) {
                  showAlertDialog(context, val);
                },
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: blockWidth * 7.5),
          child: Divider(color: Colors.deepPurple[900]),
        )
      ],
    );
  }

  showAlertDialog(BuildContext context, var val) {
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text((this.widget.toggleValue == true)
          ? "Are you sure you want to dissable this account ?"
          : "Are you sure you want to enable this account ?"),
      actions: [
        FlatButton(
          child: Text("NO"),
          onPressed: () {
            Get.back();
          },
        ),
        FlatButton(
          child: Text("YES"),
          onPressed: () {
            setState(() {
              this.widget.callback();
              this.widget.toggleValue = val;
            });
            Get.back();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
