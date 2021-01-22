import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomStudentsCard extends StatefulWidget {
  String title;
  final VoidCallback callback;
  double height;
  bool toggleValue;
  String id;

  CustomStudentsCard({
    @required this.title,
    @required this.callback,
    @required this.toggleValue,
    @required this.id,
    this.height,
  });

  @override
  _CustomStudentsCardState createState() => _CustomStudentsCardState();
}

class _CustomStudentsCardState extends State<CustomStudentsCard> {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: blockHeight * 1, horizontal: blockWidth * 5),
          width: double.infinity,
          height: (this.widget.height == null)
              ? blockHeight * 12
              : this.widget.height,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: blockWidth * 7.5,
              vertical: blockWidth * 4,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomText(
                    text: this.widget.title,
                    color: Colors.deepPurple[500],
                    size: blockHeight * 3,
                    weight: FontWeight.w700,
                  ),
                ),
                FlutterSwitch(
                  width: blockWidth * 10,
                  height: blockHeight * 2.5,
                  toggleSize: blockHeight * 2,
                  activeColor: Colors.deepPurple[400],
                  value: this.widget.toggleValue,
                  onToggle: (val) {
                    setState(() {
                      this.widget.toggleValue = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
