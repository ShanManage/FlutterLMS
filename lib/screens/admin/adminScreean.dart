import 'package:LoginSample/screens/admin/AddDocumentScreen.dart';
import 'package:LoginSample/screens/admin/AddUserScreen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.brown[100],
        child: Column(
          children: [
            Container(
              height: 50.0,
              color: Colors.brown[300],
              child: TabBar(
                controller: _controller,
                tabs: [
                  Tab(text: "Add User"),
                  Tab(text: "Add Document"),
                ],
              ),
            ),
            Container(
              height: 650.0,
              child: TabBarView(
                controller: _controller,
                children: [AddUserScreen(), AddDocumentScreen()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
