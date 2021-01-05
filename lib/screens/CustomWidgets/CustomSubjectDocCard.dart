import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomSubjectDocCard extends StatelessWidget {
  String title;
  String imagePath;
  final VoidCallback callback;

  CustomSubjectDocCard(
      {@required this.title,
      @required this.imagePath,
      @required this.callback});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: blockHeight * 1.5, horizontal: blockWidth * 5),
          width: double.infinity,
          height: blockHeight * 19,
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
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockHeight * 1,
                    vertical: blockHeight * 1,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 1.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Image.asset(imagePath),
                  // Icon(
                  //   cardIcon,
                  //   size: blockHeight * 5,
                  //   color: Colors.black54,
                  // ),
                ),
                VerticalDivider(
                  color: Colors.black54,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                CustomText(
                  text: title,
                  color: Colors.black54,
                  size: blockHeight * 3,
                  weight: FontWeight.w400,
                ),
                IconButton(
                  color: Colors.black54,
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
