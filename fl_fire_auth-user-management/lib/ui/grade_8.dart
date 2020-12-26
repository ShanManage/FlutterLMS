import 'package:fl_fire_auth/utils/auth_helper.dart';
import 'package:flutter/material.dart';

class HomePageeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Grade 8'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Home Page Grade 8"),
            RaisedButton(
              child: Text("Log out"),
              onPressed: () {
                AuthHelper.logOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
