import 'package:LoginSample/models/User.dart';
import 'package:LoginSample/screens/CostomWidgets/CustomText.dart';
import 'package:LoginSample/screens/admin/adminScreean.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/SubjectListScreen.dart';
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
    return SafeArea(
      child: Scaffold(
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
        body: Container(
          child: StreamBuilder(
            stream: _as.getGrade(user.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.exists) {
                this.user.grade = snapshot.data["grade"];
                return Container(
                  child: (this.user.grade == 0)
                      ? AdminScreen()
                      : SubjectListScreen(grade: this.user.grade),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
