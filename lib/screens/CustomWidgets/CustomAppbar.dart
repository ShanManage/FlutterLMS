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
          image: AssetImage("assets/66.jpg"),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (callbackHead != null)
                    ? Container(
                        padding: EdgeInsets.all(blockWidth * 2),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[400].withOpacity(0.3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_back,
                            size: blockWidth * 6,
                            color: Colors.black,
                          ),
                          onTap: () {
                            callbackHead();
                          },
                        ),
                      )
                    : Container(
                        width: blockWidth * 7,
                      ),
                (callbackTail != null)
                    ? Container(
                        padding: EdgeInsets.all(blockWidth * 2),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[400].withOpacity(0.3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.more_vert,
                            size: blockWidth * 6,
                            color: Colors.black,
                          ),
                          onTap: () {
                            print("click");
                            callbackTail();
                          },
                        ),
                      )
                    : Container(
                        width: blockWidth * 7,
                      ),
              ],
            ),
            CustomText(
              text: title,
              size: blockHeight * 6,
              weight: FontWeight.w600,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
