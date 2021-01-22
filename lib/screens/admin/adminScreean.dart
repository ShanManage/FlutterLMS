import 'package:LoginSample/screens/admin/AddDocumentScreen.dart';
import 'package:LoginSample/screens/admin/AddUserScreen.dart';
import 'package:LoginSample/screens/admin/addSubjectScreen.dart';
import 'package:LoginSample/screens/admin/gradeListScreen.dart';
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
    GradeListScreen(),
    AddSubjectScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: blockHeight * 4.5),
        color: Colors.blueGrey[50],
        child: Column(
          children: [
            Container(
              height: blockHeight * 69,
              child: _children[_currentIndex],
            ),
            Container(
              child: BottomNavigationBar(
                backgroundColor: Colors.blueGrey[100],
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                fixedColor: Colors.deepPurple[600],
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_add),
                    label: "Add student",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.note_add),
                    label: "Add Document",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_search),
                    label: "All students",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.auto_stories),
                    label: "Add subject",
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
