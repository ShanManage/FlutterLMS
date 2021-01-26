import 'package:LoginSample/models/User.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/admin/AdminScreean.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/SubjectListScreen.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final LocalUser user;

  Home({this.user});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: _auth.getGrade(user.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.exists) {
                this.user.grade = snapshot.data["grade"];
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: blockHeight * 100,
                      child: Container(
                        child: (this.user.grade == 0)
                            ? AdminScreen()
                            : SubjectListScreen(grade: this.user.grade),
                      ),
                    ),
                  ],
                );
              } else {
                return CustomLoading();
              }
            },
          ),
        ),
      ),
    );
  }
}
