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
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.symmetric(horizontal: blockHeight * 8),
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
