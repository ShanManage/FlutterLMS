import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  FontWeight weight;
  Color color;
  double size;

  CustomText({@required this.text, this.weight, this.color, this.size});

  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (weight != null) ? weight : FontWeight.w500,
        fontSize: (size != null) ? size : blockWidth * 5,
        color: (color != null) ? color : Colors.white,
      ),
      softWrap: true,
      maxLines: null,
    );
  }
}
