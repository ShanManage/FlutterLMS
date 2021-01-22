import 'package:LoginSample/screens/CustomWidgets/CustomIconButton.dart';
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
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage("assets/cover.jpg"),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey[400],
            blurRadius: 20,
            spreadRadius: 3,
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (callbackHead != null)
                    ? CustomIconButton(
                        icon: Icons.arrow_back,
                        callback: () {
                          callbackHead();
                        },
                      )
                    : Container(
                        width: blockWidth * 7,
                      ),
                (callbackTail != null)
                    ? CustomIconButton(
                        icon: Icons.more_vert,
                        callback: () {
                          callbackTail();
                        },
                      )
                    : Container(
                        width: blockWidth * 7,
                      ),
              ],
            ),
            CustomText(
              text: title,
              size: blockHeight * 5,
              weight: FontWeight.w600,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
