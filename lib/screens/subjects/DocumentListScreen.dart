import 'package:LoginSample/screens/CustomWidgets/CustomCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/Video/VideoViewScreen.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class DocumentListScreen extends StatefulWidget {
  List<dynamic> docList = new List();
  String appBarTitle;
  VoidCallback callback;

  DocumentListScreen(
      {@required this.docList,
      @required this.appBarTitle,
      @required this.callback});
  @override
  _DocumentListScreenState createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: this.widget.appBarTitle,
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
            children: loadDocument(),
          ),
        ),
      ),
    );
  }

  loadDocument() {
    return this
        .widget
        .docList
        .map((doc) => CustomCard(
            title: doc["title"],
            callback: () {
              this.widget.callback();
            }))
        .toList();
  }
}