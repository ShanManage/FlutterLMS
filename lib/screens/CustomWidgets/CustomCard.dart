import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String title;
  final VoidCallback callback;
  double height;

  CustomCard({@required this.title, @required this.callback, this.height});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: blockHeight * 1),
        color: Colors.grey[400],
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.symmetric(
            //       vertical: blockHeight * 1.5, horizontal: blockWidth * 10),
            //   width: double.infinity,
            //   height: (this.height == null) ? blockHeight * 12 : height,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: blockWidth * 7.5,
            //       vertical: blockWidth * 4,
            //     ),
            //     decoration: BoxDecoration(
            //       color: Colors.lightGreen[400].withOpacity(0.7),
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(15.0),
            //       ),
            //     ),
            //     child: Center(
            //       child: CustomText(
            //         text: title,
            //         color: Colors.black,
            //         size: blockHeight * 4,
            //       ),
            //     ),
            //   ),
            // ),
            Image.asset(
              'assets/music.png',
              // width: blcok,
              height: blockHeight * 25,
              fit: BoxFit.fitWidth,
            ),
            Container(
              height: blockHeight * 5,
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.white,
              child: CustomText(
                text: title,
                color: Colors.black,
                size: blockHeight * 3,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        callback();
      },
    );
  }
}
