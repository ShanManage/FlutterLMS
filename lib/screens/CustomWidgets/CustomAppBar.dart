import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({@required this.title});

  double blockWidth = SizeConfig.safeBlockHorizontal;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(
        text: title,
        size: blockWidth * 8,
      ),
      actions: [
        FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("logout"),
            onPressed: () async {
              await _auth.signOut();
            })
      ],
    );
  }
}
