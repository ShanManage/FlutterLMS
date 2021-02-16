import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisableNotification extends StatelessWidget {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Container(
          child: Column(
            children: [
              CustomAppbar(
                title: "LMS",
                callbackTail: () async {
                  await authService.signOut();
                },
                callbackHead: null,
              ),
              Container(
                padding: EdgeInsets.only(top: blockHeight),
                height: blockHeight * 80,
                child: CustomNotificationCard(
                  title:
                      "Permission denied",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
