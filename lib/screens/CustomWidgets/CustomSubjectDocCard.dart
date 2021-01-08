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
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30,
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: blockHeight * 1,
                  vertical: blockHeight * 1,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple[500], width: 1.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Image.asset(
                  imagePath,
                  color: Colors.deepPurple[500],
                ),
              ),
              SizedBox(width: blockWidth * 5),
              VerticalDivider(
                color: Colors.deepPurple[500],
                thickness: 2,
                indent: 15,
                endIndent: 15,
              ),
              SizedBox(width: blockWidth * 5),
              Expanded(
                child: CustomText(
                  text: title,
                  color: Colors.deepPurple[500],
                  size: blockHeight * 3,
                  weight: FontWeight.w700,
                ),
              ),
              IconButton(
                color: Colors.deepPurple[500],
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: blockHeight * 4,
                ),
                onPressed: () {
                  callback();
                },
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        callback();
      },
    );
  }
}
