import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/admin/SubjectManagement/AddDocumentScreen.dart';
import 'package:LoginSample/screens/admin/UserManagement/AddUserScreen.dart';
import 'package:LoginSample/screens/admin/UserManagement/gradeListScreen.dart';
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
    AddUserScreen(),
    AddDocumentScreen(),
    GradeListScreen(),
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
        title = "Users";
        break;
      case 1:
        title = "Subjects";
        break;
      case 2:
        title = "All";
        break;
      default:
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
            CustomAppbar(
              title: getAppbarTitle(_currentIndex),
              callbackTail: () async {
                await _auth.signOut();
              },
              callbackHead: null,
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: blockHeight),
                child: Column(
                  children: [
                    Container(
                      height: blockHeight * 70,
                      child: _children[_currentIndex],
                    ),
                    Container(
                      height: blockHeight * 9,
                      child: BottomNavigationBar(
                        backgroundColor: Colors.blueGrey[100],
                        onTap: onTabTapped,
                        currentIndex: _currentIndex,
                        fixedColor: Colors.deepPurple[700],
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person_add),
                            label: "Users ",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.note_add),
                            label: "Subjects ",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person_search),
                            label: "All",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
