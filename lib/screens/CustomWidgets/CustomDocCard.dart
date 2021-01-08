import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class CustomDocCard extends StatelessWidget {
  String title, thumbnailURL, defaultThumbnail;
  final VoidCallback callback;
  CustomDocCard(
      {@required this.title,
      @required this.thumbnailURL,
      @required this.callback,
      @required this.defaultThumbnail});

  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        // color: Colors.black12,
        padding: EdgeInsets.symmetric(
          vertical: blockHeight * 2,
        ),
        width: blockWidth * 42.5,
        height: blockHeight * 26,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white60,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30,
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: blockHeight * 15,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  image: DecorationImage(
                    image: (this.thumbnailURL != null)
                        ? NetworkImage(this.thumbnailURL.toString())
                        : AssetImage(defaultThumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(blockWidth * 2),
                child: Expanded(
                  child: CustomText(
                    text: title,
                    color: Colors.blueGrey[900],
                    size: blockHeight * 2,
                    weight: FontWeight.w500,
                  ),
                ),
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
