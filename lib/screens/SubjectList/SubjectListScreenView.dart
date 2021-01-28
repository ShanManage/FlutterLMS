import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/SubjectList/SubjectListScreenViewModel.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class SubjectListScreen extends StatelessWidget {
  int grade;
  SubjectListScreen({@required this.grade});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubjectListScreenViewModel>.reactive(
        builder: (_, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.blueGrey[50],
              body: Container(
                child: Column(
                  children: [
                    CustomAppbar(
                      title: "LMS",
                      callbackTail: () async {
                        await model.authService.signOut();
                      },
                      callbackHead: null,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: blockHeight),
                      height: blockHeight * 80,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: model.getDataStream(grade),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CustomLoading();
                          } else {
                            if (snapshot.hasData && snapshot.data.size != 0) {
                              return Container(
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children:
                                      model.loadSubjects(snapshot, context),
                                ),
                              );
                            } else {
                              return CustomNotificationCard(
                                title:
                                    "Something went wrong.. Plese restart the app after few minutes",
                              );
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => SubjectListScreenViewModel());
  }
}
