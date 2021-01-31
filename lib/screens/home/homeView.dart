import 'package:LoginSample/models/User.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/SubjectList/SubjectListScreenView.dart';
import 'package:LoginSample/screens/admin/AdminView.dart';
import 'package:LoginSample/screens/home/homeViewModel.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final LocalUser user;

  Home({this.user});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blueGrey[50],
            body: SingleChildScrollView(
              child: StreamBuilder(
                stream: model.getDataStream(user.uid),
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
      },
    );
  }
}
