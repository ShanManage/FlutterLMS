import 'package:LoginSample/models/user.dart';
import 'package:LoginSample/screens/CostomWidgets/CostomText.dart';
import 'package:LoginSample/screens/shared/globals.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final LocalUser _user;

  Home(this._user);

  double blockHeight = Globals.blockHeight;
  double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "LMS",
          size: blockWidth * 10,
        ),
        actions: [
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async {
                await _auth.signOut();
              })
        ],
      ),
      body: _buildBody(),
    );
  }

  // ignore: missing_return
  Container _buildBody() {
    if (_user.grade == "six") {
      return Container(
        child: Text("six"),
      );
    } else if (_user.grade == "seven") {
      return Container(
        child: Text("seven"),
      );
    }
  }
}
