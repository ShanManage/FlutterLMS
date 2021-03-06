import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  VoidCallback callback;
  IconData icon;
  CustomIconButton({@required this.callback, @required this.icon});
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(blockWidth * 2),
        decoration: BoxDecoration(
          color: Colors.deepPurple[200].withOpacity(0.8),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Icon(
          icon,
          size: blockWidth * 6,
          color: Colors.black,
        ),
      ),
      onTap: () {
        callback();
      },
    );
  }
}
