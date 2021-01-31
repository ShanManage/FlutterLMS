import 'package:LoginSample/screens/admin/AdminHome/AdminHomeScreen.dart';
import 'package:LoginSample/screens/admin/CustomWidgets/CustomAdminAppbar.dart';
import 'package:LoginSample/screens/admin/SubjectManagement/SubjectTabviewScreen.dart';
import 'package:LoginSample/screens/admin/UserManagement/StudentTabviewScreen.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with SingleTickerProviderStateMixin {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  final AuthService _auth = AuthService();

  int _currentIndex = 0;

  final List<Widget> _children = [
    AdminHomeScreen(),
    StudentTabviewSCreen(),
    SubjectTabviewScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String getAppbarTitle(int index) {
    String title;
    switch (index) {
      case 0:
        title = "Home";
        break;
      case 1:
        title = "Users";
        break;
      case 2:
        title = "Subjects";
        break;
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Column(
          children: [
            CustomAdminAppbar(
              title: getAppbarTitle(_currentIndex),
              callbackTail: () async {
                await _auth.signOut();
              },
            ),
            Container(
              height: blockHeight * 82.5,
              child: _children[_currentIndex],
            ),
            Container(
              height: blockHeight * 7.5,
              child: BottomNavigationBar(
                onTap: onTabTapped,
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
  }
}
