import 'package:LoginSample/screens/admin/AdminViewModel.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'CustomWidgets/CustomAdminAppbar.dart';

// ignore: must_be_immutable
class AdminScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminScreenModel>.reactive(
      viewModelBuilder:() => AdminScreenModel(),
      builder: (_, model, child){
        return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Column(
          children: [
            CustomAdminAppbar(
              title: model.getAppbarTitle(model.currentIndex),
              callbackTail: () async {
                await model.auth.signOut();
              },
            ),
            Container(
              height: blockHeight * 82.5,
              child: model.children[model.currentIndex],
            ),
            Container(
              height: blockHeight * 7.5,
              child: BottomNavigationBar(
                onTap: model.onTabTapped,
                currentIndex: model.currentIndex, 
                selectedItemColor: Colors.deepPurple[600],
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Students",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.note),
                    label: "Subjects",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
      },
    );
  }
}