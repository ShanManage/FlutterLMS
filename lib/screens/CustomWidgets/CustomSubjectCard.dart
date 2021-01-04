import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomSubjectCard extends StatelessWidget {
  String title;
  final VoidCallback callback;
  double height;

  CustomSubjectCard(
      {@required this.title, @required this.callback, this.height});

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
          height: (this.height == null) ? blockHeight * 12 : height,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: blockWidth * 7.5,
              vertical: blockWidth * 4,
            ),
            decoration: BoxDecoration(
              color: Colors.white60,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey[100],
                  blurRadius: 30,
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: title,
                  color: Colors.blueGrey[900],
                  size: blockHeight * 3,
                  weight: FontWeight.w400,
                ),
                IconButton(
                  color: Colors.blueGrey[900],
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: blockHeight * 4,
                  ),
                  onPressed: () {
                    callback();
                  },
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        callback();
      },
    );
  }
}
