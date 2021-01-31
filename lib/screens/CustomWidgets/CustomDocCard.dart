import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
              (this.thumbnailURL != null)
                  ? Container(
                      height: blockHeight * 15,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        image: DecorationImage(
                          image: NetworkImage(this.thumbnailURL.toString()),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(blockWidth * 5),
                      height: blockHeight * 15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                      ),
                      child: Image.asset(defaultThumbnail),
                    ),
              Container(
                padding: EdgeInsets.all(blockWidth * 2),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: title,
                        color: Colors.blueGrey[900],
                        size: blockHeight * 2,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
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
