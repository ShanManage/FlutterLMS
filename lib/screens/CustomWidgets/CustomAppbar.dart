import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  String title;
  VoidCallback callbackHead, callbackTail;
  CustomAppbar(
      {@required this.title, this.callbackHead, @required this.callbackTail});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight * 20,
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        image: DecorationImage(
          image: AssetImage("assets/77.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey[400],
            blurRadius: 25,
            spreadRadius: 3,
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (callbackHead != null)
                ? IconButton(
                    color: Colors.black,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: blockWidth * 7,
                    ),
                    onPressed: () {
                      callbackHead();
                    },
                  )
                : Container(
                    width: blockWidth * 7,
                  ),
            // SizedBox(width: blockWidth * 15),
            CustomText(
              text: title,
              size: blockHeight * 6,
              weight: FontWeight.w600,
              color: Colors.black,
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.more_vert,
                size: blockHeight * 4,
              ),
              onPressed: () {
                callbackTail();
              },
            )
          ],
        ),
      ),
    );
  }
}
