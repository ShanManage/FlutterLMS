import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomNotificationCard extends StatelessWidget {
  String title;
  IconData cardIcon;
  double height, width;
  CustomNotificationCard(
      {@required this.title, this.cardIcon, this.height, this.width});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: blockHeight * 1.5, horizontal: blockWidth * 5),
        width: (width != null) ? width : double.infinity,
        height: (height == null) ? blockHeight * 25 : height,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: blockWidth * 7.5,
            vertical: blockWidth * 4,
          ),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            border: Border.all(color: Colors.red, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.red[100],
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
              Icon(
                (cardIcon != null) ? cardIcon : Icons.mood_bad,
                size: blockHeight * 8,
                color: Colors.red,
              ),
              SizedBox(width: blockWidth * 5),
              CustomText(
                text: title,
                color: Colors.red,
                size: blockHeight * 4,
                weight: FontWeight.w300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
