import 'package:LoginSample/screens/CostomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String title;
  final VoidCallback callback;

  CustomCard({
    @required this.title,
    @required this.callback,
  });

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: blockHeight * 1),
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: blockWidth * 7.5,
            vertical: blockWidth * 4,
          ),
          decoration: BoxDecoration(
            color: Colors.lightGreen[400].withOpacity(0.7),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                text: title,
                color: Colors.black,
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
