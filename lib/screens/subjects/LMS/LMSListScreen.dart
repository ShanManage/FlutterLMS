import 'package:LoginSample/screens/CustomWidgets/CustomCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class LMSListScreen extends StatelessWidget {
  List<dynamic> lmsList = new List();
  LMSListScreen({@required this.lmsList});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Audio",
            size: blockWidth * 8,
          ),
          actions: [
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text("logout"),
                onPressed: () async {
                  await _auth.signOut();
                })
          ],
        ),
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: loadLMS(),
          ),
        ),
      ),
    );
  }

  loadLMS() {
    return lmsList
        .map((lms) => CustomCard(title: lms["title"], callback: () {}))
        .toList();
  }
}
