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
    return Center(
      child: Container(
        height: blockHeight * 20,
        decoration: BoxDecoration(
          color: Colors.blueGrey[800],
          image: DecorationImage(
            image: AssetImage("assets/11.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0)),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (callbackHead != null)
                  ? IconButton(
                      color: Colors.white,
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
              SizedBox(width: blockWidth * 15),
              CustomText(
                text: title,
                size: blockHeight * 5,
                weight: FontWeight.w400,
              ),
              IconButton(
                color: Colors.white,
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
      ),
    );
  }
}
