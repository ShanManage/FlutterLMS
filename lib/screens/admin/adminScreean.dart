import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/admin/AddDocumentScreen.dart';
import 'package:LoginSample/screens/admin/AddUserScreen.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with SingleTickerProviderStateMixin {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  int _currentIndex = 0;
  final List<Widget> _children = [
    AddUserScreen(),
    AddDocumentScreen(),
  ];
  // TabController _controller;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: blockHeight * 0.5),
        color: Colors.blueGrey[50],
        child: Column(
          children: [
            Container(
              height: blockHeight * 73,
              child: _children[_currentIndex],
            ),
            Container(
              child: BottomNavigationBar(
                backgroundColor: Colors.blueGrey[100],
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_add),
                    label: "Add User",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.note_add),
                    label: "Add Document",
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
