import 'package:LoginSample/models/user.dart';
import 'package:LoginSample/screens/CostomWidgets/CostomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final LocalUser user;

  Home(this.user);
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  AuthService _as = AuthService();

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
      body: StreamBuilder(
        stream: _as.getGrade(user.uid),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.exists) {
            this.user.grade = snapshot.data["grade"];
            return Container(
              child: Text(this.user.grade.toString()),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      // _buildBody(),
    );
  }

  // ignore: missing_return

}
