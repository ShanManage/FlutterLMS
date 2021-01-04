import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomSubjectCard.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class VideoListScreen extends StatelessWidget {
  List<dynamic> videoList = new List();
  VideoListScreen({@required this.videoList});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Videos",
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
          children: loadVideos(),
        ),
      ),
    );
  }

  loadVideos() {
    return videoList
        .map(
          (video) => CustomSubjectCard(title: video["title"], callback: () {}),
        )
        .toList();
  }
}
