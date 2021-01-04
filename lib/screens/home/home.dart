import 'package:LoginSample/models/User.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/admin/adminScreean.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/SubjectListScreen.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final LocalUser user;

  Home({this.user});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  AuthService _as = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: CustomAppbar(
                title: "LMS",
                callbackTail: () async {
                  await _auth.signOut();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: blockHeight * 20),
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
                    return CustomLoading();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
