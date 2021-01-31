import 'package:LoginSample/services/auth.dart';
import 'package:flutter/cupertino.dart';

import 'AdminHome/AdminHomeScreen.dart';
import 'SubjectManagement/SubjectTabviewScreen.dart';
import 'UserManagement/StudentTabviewScreen.dart';

class AdminScreenModel extends ChangeNotifier{
  final AuthService auth = AuthService();

  int currentIndex = 0;

  final List<Widget> children = [
    AdminHomeScreen(),
    StudentTabviewSCreen(),
    SubjectTabviewScreen(),
  ];

  void onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String getAppbarTitle(int index) {
    String title;
    switch (index) {
      case 0:
        title = "Home";
        break;
      case 1:
        title = "Students";
        break;
      case 2:
        title = "Subjects";
        break;
    }
    return title;
  }
}