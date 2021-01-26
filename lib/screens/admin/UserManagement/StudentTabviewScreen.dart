import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/admin/UserManagement/AddUserScreen.dart';
import 'package:LoginSample/screens/admin/UserManagement/GradeListScreen.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class StudentTabviewSCreen extends StatefulWidget {
  @override
  _StudentTabviewSCreenState createState() => _StudentTabviewSCreenState();
}

class _StudentTabviewSCreenState extends State<StudentTabviewSCreen>
    with SingleTickerProviderStateMixin {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: blockHeight * 0.5),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            color: Colors.black12,
            height: blockHeight * 6,
            width: double.infinity,
            child: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              indicatorWeight: blockWidth * 0.5,
              controller: _tabController,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding:
                  EdgeInsets.symmetric(horizontal: blockHeight * 8.75),
              tabs: [
                Tab(
                  child: CustomText(
                    text: "User List",
                    size: blockWidth * 4,
                    weight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  child: CustomText(
                    text: "Add User",
                    size: blockWidth * 4,
                    weight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: blockHeight * 75,
            child: TabBarView(
              controller: _tabController,
              children: [
                GradeListScreen(),
                AddUserScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
