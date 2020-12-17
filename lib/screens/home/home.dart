import 'package:LoginSample/models/user.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final LocalUser _user;

  Home(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test home.!"),
        actions: [
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async {
                await _auth.signOut();
              })
        ],
      ),
      body: _buildBody(),
    );
  }

  // ignore: missing_return
  Container _buildBody() {
    if (_user.grade == "six") {
      return Container(
        child: Text("six"),
      );
    } else if (_user.grade == "seven") {
      return Container(
        child: Text("seven"),
      );
    }
  }
}
