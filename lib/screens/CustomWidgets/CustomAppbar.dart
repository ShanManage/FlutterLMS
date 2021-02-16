import 'package:LoginSample/screens/CustomWidgets/CustomIconButton.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget {
  String title;
  VoidCallback callbackHead, callbackTail;
  CustomAppbar({
    @required this.callbackTail,
    @required this.title,
    this.callbackHead,
  });

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  List<DropdownChoices> dropdownChoices = <DropdownChoices>[
    DropdownChoices(title: 'Logout', icon: Icons.directions_bike),
    DropdownChoices(title: 'change password', icon: Icons.directions_car),
  ];

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
                    ? PopupMenuButton<DropdownChoices>(
                        onSelected: null,
                        elevation: 6,
                        itemBuilder: (BuildContext context) {
                          return dropdownChoices.map((DropdownChoices choice) {
                            return PopupMenuItem<DropdownChoices>(
                              value: choice,
                              child: Text(choice.title),
                            );
                          }).toList();
                        },
                      )
                    // CustomIconButton(
                    //     icon: Icons.more_vert,
                    //     callback: () {
                    //       callbackTail();
                    //     },
                    //   )
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

class DropdownChoices {
  const DropdownChoices({this.title, this.icon});

  final String title;
  final IconData icon;
}
